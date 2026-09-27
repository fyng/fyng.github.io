// Graphical abstracts: show the static poster; play the animation on attention.
//   pointer devices (laptops): on hover or keyboard focus; stop and reset on leave
//   touch devices (phones):    when at least 60% on screen; stop below 25%
// Reduced-motion users only ever see the poster. The video (MP4, WebM fallback)
// loads on first play.
(function () {
  if (window.__gaInit) return;
  window.__gaInit = true;

  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)");
  const pointer = window.matchMedia("(hover: hover) and (pointer: fine)");

  function setup(fig) {
    const video = fig.querySelector("video");
    if (!video) return;
    let wanted = false;

    // Reveal the video only once frames are actually playing, so the poster never
    // flashes to a blank frame while the file loads.
    video.addEventListener("playing", () => {
      if (wanted) fig.classList.add("is-playing");
    });

    const play = () => {
      if (reduce.matches || wanted) return;
      wanted = true;
      if (!video.firstElementChild) {
        for (const spec of video.dataset.sources.split(",")) {
          const [src, type] = spec.trim().split(/\s+/);
          const source = document.createElement("source");
          Object.assign(source, { src, type });
          video.appendChild(source);
        }
        video.load();
      }
      try {
        video.currentTime = 0;
      } catch (e) {}
      const p = video.play();
      if (p) p.catch(stop);
    };
    function stop() {
      wanted = false;
      fig.classList.remove("is-playing");
      video.pause();
      try {
        video.currentTime = 0;
      } catch (e) {}
    }

    if (pointer.matches) {
      fig.addEventListener("mouseenter", play);
      fig.addEventListener("mouseleave", stop);
      fig.addEventListener("focus", play);
      fig.addEventListener("blur", stop);
    } else if ("IntersectionObserver" in window) {
      new IntersectionObserver((entries) => entries.forEach((e) => (e.intersectionRatio >= 0.6 ? play() : e.intersectionRatio < 0.25 && stop())), {
        threshold: [0, 0.25, 0.6],
      }).observe(fig);
    }
  }

  const init = () => document.querySelectorAll("[data-ga]").forEach(setup);
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init);
  else init();
})();
