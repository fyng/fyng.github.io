// Precision Safety graphical abstract, Revideo (Motion Canvas API) version.
// Structure uses flexbox layout; each column's diagram is an absolutely
// positioned <Node> authored in top-left local coordinates via P().
import {makeScene2D, Rect, Txt, Line, Layout, Node, Img, CubicBezier} from '@revideo/2d';
import {all, delay, createRef, easeOutCubic, easeInOutCubic, waitFor, ThreadGenerator, Reference, Vector2} from '@revideo/core';
import {GA_ICONS} from '../icons';

const C = {
  ink: '#16181d', ink2: '#4a4e58', muted: '#8a8e98', rule: '#d9dbe0', wash: '#f4f5f7',
  prussian: '#1f4e79', blueWash: '#e8eff7', accent: '#d0503a', accentWash: '#fbe9e5',
  c1: '#2f6fb0', c2: '#d0503a', c3: '#1f9a8a', c4: '#c98f1f', c5: '#8a5cb8',
};
const ORGAN: Record<string, string> = {lungs: C.c1, colon: C.c3, liver: C.c4, thyroid: C.c5, adrenal: C.c2};
const SANS = 'IBM Plex Sans', SERIF = 'Instrument Serif', MONO = 'IBM Plex Mono';
const COL_W = (1472 - 160) / 3, DIA_W = COL_W, DIA_H = 400;
const P = (x: number, y: number) => new Vector2(x - DIA_W / 2, y - DIA_H / 2); // diagram top-left coords

const iconSrc = (name: string, color: string) =>
  'data:image/svg+xml;utf8,' + encodeURIComponent(
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="192" height="192" color="${color}">` +
    GA_ICONS[name].replace(/currentColor/g, color) + '</svg>');

export default makeScene2D('precision', function* (view) {
  view.fill('#ffffff');
  const cues: [number, () => ThreadGenerator][] = [];
  const hidden: Node[] = [];
  // appear at time t; 'in' = fade + rise (only for nodes outside layout), 'fade', 'pop'
  const at = <T extends Node>(t: number, node: T, kind: 'in' | 'fade' | 'pop' = 'fade'): T => {
    node.opacity(0); hidden.push(node);
    cues.push([t, () => {
      if (kind === 'pop') { node.scale(0.3); return all(node.opacity(1, 0.3), node.scale(1, 0.45, easeOutCubic)); }
      if (kind === 'in') { const y = node.y(); node.y(y + 12); return all(node.opacity(1, 0.7, easeOutCubic), node.y(y, 0.7, easeOutCubic)); }
      return node.opacity(1, 0.6, easeOutCubic);
    }]);
    return node;
  };
  const draw = (t: number, line: Line | CubicBezier, dur = 0.6) => { line.end(0); cues.push([t, () => line.end(1, dur, easeInOutCubic)]); return line; };

  const T = (text: string, o: any = {}) => <Txt text={text} fontFamily={SANS} fontSize={17} fill={C.ink} lineHeight={'140%'} {...o} />;
  const icon = (name: string, x: number, y: number, size: number, color = C.ink) =>
    <Img src={iconSrc(name, color)} width={size} height={size} position={P(x, y)} /> as Img;
  const arrow = (from: () => Vector2, to: () => Vector2, color = C.prussian, bend = 0.45) => {
    const k = (a: Vector2, b: Vector2) => Math.max(16, a.sub(b).magnitude * bend);
    return <CubicBezier p0={from} p1={() => from().addX(k(from(), to()))} p2={() => to().addX(-k(from(), to()))} p3={to}
      stroke={color} lineWidth={2.5} lineCap={'round'} endArrow arrowSize={9} /> as CubicBezier;
  };
  // Edge helpers in diagram-local coords (nodes are centred on their position).
  const rightOf = (n: Node & {width: any}, gap = 10) => () => n.position().addX(n.width() / 2 + gap);
  const leftOf = (n: Node & {width: any}, gap = 10) => () => n.position().addX(-n.width() / 2 - gap);

  // ---------------------------------------------------------------- structure
  const dia = [createRef<Node>(), createRef<Node>(), createRef<Node>()];
  const slot = [createRef<Rect>(), createRef<Rect>(), createRef<Rect>()];
  const all_ = createRef<Node>();
  const heads = [
    ['01 · RESOURCE', 'MSK-Tox', 'LLM-extracted from clinical notes, >50,000 patients', ''],
    ['02 · CLINICAL RISK', 'Adverse event–specific risk', 'clinical and demographic features before treatment',
      'Machine learning integrates clinical and demographic risk factors specific to each adverse event'],
    ['03 · GERMLINE RISK', 'Germline susceptibility', 'matched tumor–normal sequencing, 35,669 patients',
      'Germline variants predict propensity for immune-related adrenal insufficiency'],
  ];
  const headT = [0.7, 5.0, 9.0], conclT = [0, 8.1, 12.8];
  const root = createRef<Layout>();
  const kicker = createRef<Txt>(), title = createRef<Txt>(), take = createRef<Txt>();
  const colHeads: Txt[][] = [[], [], []], concl: Txt[] = [];

  view.add(<Node ref={all_} />);
  all_().add(
    <Layout ref={root} layout direction={'column'} width={1472} height={820} y={4}>
      <Txt ref={kicker} text={'PRECISION SAFETY · MEDRXIV 2026'} fontFamily={MONO} fontWeight={500} fontSize={15} letterSpacing={2.4} fill={C.muted} />
      <Txt ref={title} marginTop={12} fontFamily={SERIF} fontSize={40} lineHeight={'112%'} fill={C.ink} textWrap={'pre'}
        text={'Can we predict individual adverse event risk from cancer therapy\nusing information at the point of treatment decision?'} />
      <Rect marginTop={20} width={1472} height={1.5} fill={C.rule} />
      <Layout direction={'row'} marginTop={22} height={566}>
        {heads.map((h, i) => (
          <>
            {i > 0 && <Rect width={1.5} height={562} fill={C.rule} marginLeft={39.25} marginRight={39.25} />}
            <Layout direction={'column'} width={COL_W} height={566}>
              <Txt ref={(n: Txt) => colHeads[i].push(n)} text={h[0]} fontFamily={MONO} fontWeight={500} fontSize={14} letterSpacing={2.2} fill={C.prussian} />
              <Txt ref={(n: Txt) => colHeads[i].push(n)} text={h[1]} marginTop={10} fontFamily={SERIF} fontSize={34} fill={C.ink} />
              <Txt ref={(n: Txt) => colHeads[i].push(n)} text={h[2]} marginTop={6} fontFamily={SANS} fontSize={15} fill={C.muted} />
              <Rect ref={slot[i]} width={DIA_W} height={DIA_H} marginTop={14} />
              <Txt ref={(n: Txt) => concl.push(n)} text={h[3]} width={COL_W} textWrap fontFamily={SANS} fontSize={17} lineHeight={'140%'} fill={C.ink} marginTop={8} />
            </Layout>
          </>
        ))}
      </Layout>
      <Rect marginTop={8} width={1472} height={1.5} fill={C.rule} />
      <Txt ref={take} marginTop={18} fontFamily={SERIF} fontSize={32} fill={C.ink}>
        <Txt text={'A '} />
        <Txt text={'precision safety'} fontStyle={'italic'} fill={C.accent} />
        <Txt text={' paradigm is needed to complement response prediction in personalized medicine.'} />
      </Txt>
    </Layout>,
  );
  // Diagrams live outside the layout tree, pinned to their placeholder slots
  // (nesting free-positioned nodes inside flexbox creates a signal cycle).
  slot.forEach((sl, i) => all_().add(<Node ref={dia[i]} />));
  // Layout children can only fade (flexbox owns their position).
  at(0.1, kicker()); at(0.1, title()); at(13.4, take());
  colHeads.forEach((hs, i) => hs.forEach((n) => at(headT[i], n)));
  concl.forEach((n, i) => i > 0 && at(conclT[i], n));

  // ---------------------------------------------------------------- 01 MSK-Tox
  const d1 = dia[0]();
  const notes = [icon('note', 58, 48, 84), icon('note', 50, 56, 84), icon('note', 42, 64, 84)];
  notes.forEach((n, i) => d1.add(at(1.1 + i * 0.15, n, 'in')));
  const llm = <Rect width={96} height={80} radius={12} fill={C.prussian} position={P(218, 60)} layout alignItems={'center'} justifyContent={'center'}>
    <Txt text={'LLM'} fontFamily={MONO} fontWeight={500} fontSize={20} letterSpacing={2} fill={'#fff'} />
  </Rect> as Rect;
  d1.add(at(2.1, llm, 'pop'));
  const outs = T('incidence\ntiming\ngrade', {textWrap: 'pre', fill: C.ink2, offset: [-1, 0], position: P(342, 60)}) as Txt;
  d1.add(at(2.5, outs, 'in'));
  const a1 = arrow(rightOf(notes[2], 8), leftOf(llm)); d1.add(draw(1.8, a1));
  const a2 = arrow(rightOf(llm), () => outs.position().addX(-10)); d1.add(draw(2.4, a2));

  // legend: flex row does the spacing
  const legend = <Layout layout direction={'row'} alignItems={'center'} gap={20} offset={[-1, 0]} position={P(0, 146)} /> as Layout;
  for (const k of Object.keys(ORGAN))
    legend.add(<Layout direction={'row'} alignItems={'center'} gap={6}>
      <Img src={iconSrc(k, ORGAN[k])} width={28} height={28} />
      {T({lungs: 'lung', colon: 'colon', liver: 'liver', thyroid: 'thyroid', adrenal: 'adrenal'}[k]!, {fontSize: 15, fill: C.ink2})}
    </Layout>);
  d1.add(at(2.7, legend));

  const tl = {x0: 8, x1: DIA_W, y0: 190, dy: 40, n: 5}, sx = tl.x0 + 44;
  const tlLines: Line[] = [];
  for (let i = 0; i < tl.n; i++) tlLines.push(<Line points={[P(tl.x0, tl.y0 + i * tl.dy), P(tl.x1, tl.y0 + i * tl.dy)]} stroke={C.rule} lineWidth={1.5} /> as Line);
  tlLines.forEach((l, i) => d1.add(draw(3.0 + i * 0.1, l, 0.8)));
  d1.add(at(2.9, <Line points={[P(sx, tl.y0 - 16), P(sx, tl.y0 + 168)]} stroke={C.ink} lineWidth={2} lineDash={[3, 5]} /> as Line));
  d1.add(at(2.9, T('therapy start', {fontSize: 15, fill: C.muted, position: P(sx, tl.y0 + 186)}) as Txt));
  d1.add(at(2.9, T('time →', {fontSize: 15, fill: C.muted, offset: [1, 0], position: P(tl.x1, tl.y0 + 186)}) as Txt));
  const ev: [number, string, number, number][] = [[0, 'lungs', .42, 40], [1, 'colon', .26, 28], [1, 'liver', .78, 40], [2, 'thyroid', .6, 28], [3, 'adrenal', .9, 38], [4, 'colon', .2, 40], [4, 'thyroid', .5, 26]];
  ev.forEach(([r, k, f, s], i) => d1.add(at(3.6 + i * 0.1, icon(k, sx + f * (tl.x1 - sx - 20), tl.y0 + r * tl.dy, s, ORGAN[k]), 'pop')));

  // ---------------------------------------------------------------- 02 clinical risk
  const d2 = dia[1]();
  const pA = icon('person', 30, 120, 60), pB = icon('person', 30, 320, 60);
  d2.add([at(5.4, pA, 'in'), at(5.4, pB, 'in')]);
  d2.add(at(5.4, T('PT A', {fontFamily: MONO, fontSize: 13, letterSpacing: 1.5, fill: C.ink2, position: P(30, 164)}) as Txt));
  d2.add(at(5.4, T('PT B', {fontFamily: MONO, fontSize: 13, letterSpacing: 1.5, fill: C.ink2, position: P(30, 364)}) as Txt));
  d2.add(at(5.7, T('lung cancer · immunotherapy\nage 71 · COPD', {textWrap: 'pre', fontSize: 15, fill: C.ink2, offset: [-1, -1], position: P(62, 36)}) as Txt));
  d2.add(at(5.7, T('melanoma · combination ICI\nage 48 · history of IBD', {textWrap: 'pre', fontSize: 15, fill: C.ink2, offset: [-1, -1], position: P(62, 352)}) as Txt));
  const rf = <Rect width={116} height={96} radius={12} fill={C.blueWash} position={P(204, 220)} layout direction={'column'} alignItems={'center'} gap={4} paddingTop={12}>
    <Layout direction={'row'} gap={-2}>{[0, 1, 2].map(() => <Img src={iconSrc('tree', C.prussian)} width={30} height={30} />)}</Layout>
    <Txt text={'random forest'} fontFamily={SANS} fontSize={13} fill={C.prussian} />
  </Rect> as Rect;
  d2.add(at(6.3, rf, 'pop'));
  const rfIn = (f: number) => () => P(146 - 10, 172 + f * 96);
  d2.add(draw(6.0, arrow(rightOf(pA), rfIn(0.3))));
  d2.add(draw(6.0, arrow(rightOf(pB), rfIn(0.7))));
  const profile = (top: number, vals: number[], t: number, label: boolean) => {
    const bx = DIA_W - 82;
    if (label) d2.add(at(t, T('predicted risk', {fontSize: 15, fill: C.muted, offset: [-1, -1], position: P(bx - 24, top - 30)}) as Txt));
    ['lungs', 'colon', 'liver', 'thyroid'].forEach((k, i) => {
      d2.add(at(t, icon(k, bx - 12, top + 8 + i * 26, 22, ORGAN[k]), 'in'));
      const bar = <Rect width={vals[i] * 78} height={14} radius={3} fill={ORGAN[k]} offset={[-1, -1]} position={P(bx + 4, top + 1 + i * 26)} /> as Rect;
      bar.scale.x(0); d2.add(bar);
      cues.push([t + 0.2 + i * 0.1, () => bar.scale.x(1, 0.8, easeOutCubic)]);
    });
    return () => P(bx - 12 - 11 - 10, top + 47);
  };
  const inA = profile(50, [.85, .12, .25, .18], 6.9, true), inB = profile(270, [.14, .88, .38, .55], 7.3, false);
  d2.add(draw(6.7, arrow(() => P(262 + 10, 172 + 0.3 * 96), inA)));
  d2.add(draw(6.7, arrow(() => P(262 + 10, 172 + 0.7 * 96), inB)));

  // ---------------------------------------------------------------- 03 germline
  const d3 = dia[2]();
  d3.add(at(9.5, icon('dna', 22, 48, 60, C.prussian), 'in'));
  const hla = <Rect layout fill={C.accentWash} radius={22} height={44} paddingLeft={18} paddingRight={18} alignItems={'center'} offset={[-1, 0]} position={P(58, 48)}>
    <Txt text={'HLA-DRB1*15'} fontFamily={MONO} fontWeight={500} fontSize={16} letterSpacing={1.6} fill={C.accent} />
  </Rect> as Rect;
  d3.add(at(9.9, hla, 'pop'));
  // hla has offset [-1,0], so its right edge is position.x + width
  const hlaRight = () => hla.position().addX(hla.width() + 10);
  const adr = icon('adrenal', 0, 48, 54, ORGAN.adrenal);
  adr.position(() => hla.position().addX(hla.width() + 104));
  d3.add(at(10.5, adr, 'pop'));
  const a3 = arrow(hlaRight, leftOf(adr), C.accent, 0); d3.add(draw(10.2, a3));
  const ici = T('ICI', {fontSize: 13, fill: C.muted}) as Txt;
  ici.position(() => hlaRight().add(adr.position()).scale(0.5).add([-15, -22]));
  d3.add(at(10.3, ici));
  const adrT = T('adrenal\ninsufficiency', {textWrap: 'pre', fontSize: 15, fill: C.muted, offset: [-1, 0]}) as Txt;
  adrT.position(() => adr.position().addX(27 + 10));
  d3.add(at(10.6, adrT));

  const PL = {x0: 30, x1: DIA_W - 4, y0: 158, y1: 348};
  d3.add(at(10.9, T('cumulative incidence (schematic)', {fontSize: 15, fill: C.muted, offset: [-1, -1], position: P(PL.x0, PL.y0 - 34)}) as Txt));
  d3.add(at(10.9, <Line points={[P(PL.x0, PL.y0), P(PL.x0, PL.y1), P(PL.x1, PL.y1)]} stroke={C.ink} lineWidth={1.5} /> as Line));
  const stepPts = (ys: number[]) => {
    const dx = (PL.x1 - PL.x0 - 4) / (ys.length - 1), pts = [P(PL.x0 + 2, PL.y1 - 2)];
    ys.forEach((v, i) => { const x = PL.x0 + 2 + i * dx, y = PL.y1 - 2 - v * (PL.y1 - PL.y0 - 20); pts.push(P(x, pts[pts.length - 1].y + DIA_H / 2), P(x, y)); });
    pts.push(P(PL.x1 - 2, pts[pts.length - 1].y + DIA_H / 2));
    return pts;
  };
  d3.add(draw(11.2, <Line points={stepPts([0, .06, .16, .32, .5, .64, .74, .8])} stroke={C.accent} lineWidth={2.5} lineJoin={'round'} /> as Line, 1.2));
  d3.add(draw(11.2, <Line points={stepPts([0, .01, .03, .05, .07, .1, .12, .13])} stroke={C.muted} lineWidth={2.5} lineJoin={'round'} /> as Line, 1.2));
  d3.add(at(12.3, T('HLA-DRB1*15 carriers', {fontSize: 15, fill: C.accent, offset: [1, -1], position: P(PL.x1, PL.y1 - .8 * (PL.y1 - PL.y0 - 20) - 34)}) as Txt));
  d3.add(at(12.3, T('non-carriers', {fontSize: 15, fill: C.muted, offset: [1, -1], position: P(PL.x1, PL.y1 - .13 * (PL.y1 - PL.y0 - 20) - 32)}) as Txt));
  d3.add(at(10.9, T('time on ICI →', {fontSize: 15, fill: C.muted, offset: [1, -1], position: P(PL.x1, PL.y1 + 8)}) as Txt));

  // ---------------------------------------------------------------- timeline
  // Flexbox positions only exist after the first layout pass: wait a frame,
  // then pin each diagram onto its slot (a reactive binding would cache the
  // pre-layout value).
  yield;
  const toLocal = all_().worldToLocal();
  slot.forEach((sl, i) => { const w = sl().absolutePosition(), p = new DOMPoint(w.x, w.y).matrixTransform(toLocal); dia[i]().position([p.x, p.y]); });
  yield* all(...cues.map(([t, g]) => delay(t, g())), waitFor(15.5));
  yield* all_().opacity(0, 0.5);
  hidden.length; // (kept for clarity: every cued node starts hidden)
});
