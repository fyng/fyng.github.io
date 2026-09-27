// Graphical abstracts in publication preview slots.
//   The slot shows the static poster. The animation plays in an expanded view:
//   - pointer devices (laptops): while hovering the thumbnail (a floating panel
//     that does not capture the mouse), or on click (a dismissable overlay)
//   - touch devices (phones): on tap, as a dismissable overlay
//   The expanded figure is sized to fit the viewport in portrait and landscape.
//   Reduced-motion users get the enlarged poster, never the animation.
//   The video (MP4, WebM fallback) loads on first open.
(function () {
  if (window.__gaInit) return;
  window.__gaInit = true;

  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)");
  const pointer = window.matchMedia("(hover: hover) and (pointer: fine)");
  let overlay, box, poster, video, closeBtn;
  let current = null,
    mode = null,
    lastFocus = null,
    hoverTimer = null;

  function build() {
    overlay = document.createElement("div");
    overlay.className = "ga-overlay";
    overlay.setAttribute("aria-hidden", "true");
    overlay.innerHTML =
      '<div class="ga-expanded" role="dialog" aria-modal="true">' +
      '<img alt=""><video muted playsinline loop preload="none" aria-hidden="true"></video>' +
      '<button type="button" class="ga-close" aria-label="Close">&times;</button></div>';
    document.body.appendChild(overlay);
    box = overlay.firstElementChild;
    poster = box.querySelector("img");
    video = box.querySelector("video");
    closeBtn = box.querySelector(".ga-close");
    // Reveal the video only once frames are playing, so the poster never flashes blank.
    video.addEventListener("playing", () => current && box.classList.add("is-playing"));
    overlay.addEventListener("click", () => mode === "modal" && close());
    document.addEventListener("keydown", (e) => e.key === "Escape" && current && close());
  }

  function load(thumb) {
    if (video.dataset.slug === thumb.dataset.slug) return;
    video.textContent = "";
    for (const spec of thumb.dataset.sources.split(",")) {
      const [src, type] = spec.trim().split(/\s+/);
      const source = document.createElement("source");
      Object.assign(source, { src, type });
      video.appendChild(source);
    }
    video.dataset.slug = thumb.dataset.slug;
    video.load();
  }

  function open(thumb, how) {
    if (!overlay) build();
    const same = current === thumb;
    if (same && mode === how) return;
    current = thumb;
    mode = how;
    poster.src = thumb.dataset.poster;
    poster.alt = thumb.dataset.alt;
    box.setAttribute("aria-label", thumb.dataset.alt);
    overlay.classList.add("is-open");
    overlay.classList.toggle("is-modal", how === "modal");
    overlay.setAttribute("aria-hidden", how === "modal" ? "false" : "true");
    if (!same && !reduce.matches) {
      box.classList.remove("is-playing");
      load(thumb);
      try {
        video.currentTime = 0;
      } catch (e) {}
      const p = video.play();
      if (p) p.catch(() => {});
    }
    if (how === "modal") {
      lastFocus = document.activeElement;
      document.documentElement.classList.add("ga-lock");
      closeBtn.focus({ preventScroll: true });
    }
  }

  function close() {
    if (!current) return;
    const wasModal = mode === "modal";
    current = mode = null;
    overlay.classList.remove("is-open", "is-modal");
    overlay.setAttribute("aria-hidden", "true");
    box.classList.remove("is-playing");
    video.pause();
    document.documentElement.classList.remove("ga-lock");
    if (wasModal && lastFocus) lastFocus.focus({ preventScroll: true });
  }

  function setup(thumb) {
    thumb.addEventListener("click", (e) => {
      e.preventDefault();
      clearTimeout(hoverTimer);
      open(thumb, "modal");
    });
    if (pointer.matches) {
      thumb.addEventListener("mouseenter", () => {
        clearTimeout(hoverTimer);
        hoverTimer = setTimeout(() => mode !== "modal" && open(thumb, "hover"), 150);
      });
      thumb.addEventListener("mouseleave", () => {
        clearTimeout(hoverTimer);
        if (mode === "hover") close();
      });
    }
  }

  const init = () => document.querySelectorAll("[data-ga]").forEach(setup);
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init);
  else init();
})();
