#import "style.typ": zihao, ziti
#import "utils.typ": *
#import "layout.typ": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/outrageous:0.1.0"
#import "@preview/i-figured:0.2.4"

#set page(margin: (top: 3.5cm, bottom: 4cm, left: 3cm, right: 2.5cm))
#set text(hyphenate: false, font: ziti.songti)
#set par(leading: 20pt)

#show: no-numbering-first-heading
#show: show-cn-fakebold
#show heading: i-figured.reset-counters.with(extra-kinds: ("image",))
#show figure: i-figured.show-figure.with(extra-prefixes: (image: "img:"))
#show math.equation: i-figured.show-equation

#show figure: set align(center)
#show table: set align(center)

#show bibliography: set par(hanging-indent: 0em, leading: 16pt)
#show bibliography: set text(size: zihao.wuhao)

#let fake-par = context {
  let b = par(box())
  b
  v(-measure(b + b).height)
}
#show list: it => {
  it
  fake-par
}
#show figure: it => {
  it
  fake-par
}
#show enum: it => {
  it
  fake-par
}
#show link: it => {
  underline(text(rgb(0, 0, 255), it))
}

#let uline(width, body) = box(body, width: width, stroke: (bottom: 0.5pt), outset: (bottom: 2pt))
#let distr(s, w: auto) = {
  block(
    width: w,
    stack(
      dir: ltr,
      ..s.clusters().map(x => [#x]).intersperse(1fr),
    ),
  )
}

#let date = datetime.today()
#let info = (
  student_id: "520XXXXXXXX",
  name: "张三",
  name_en: "Zhang San",
  degree: "工学硕士",
  supervisor: "李四教授",
  supervisor_en: "Prof. Li Si",
  title: "上海交通大学学位论文格式模板",
  title_en: "DISSERTATION TEMPLATE FOR MASTER DEGREE OF ENGINEERING IN SHANGHAI JIAO TONG UNIVERSITY",
  school: "某某学院",
  school_en: "School of XXXXXXX",
  major: "某某专业",
  date: date.display("[year]年[month]月[day]日"),
)

// 中文封面

#align(
  center,
  image(
    "figures/sjtu-logo.png",
    width: 3cm,
  ),
)

#align(
  center,
  text(font: ziti.songti, size: zihao.xiaoer)[上海交通大学硕士学位论文],
)

#v(3.6cm)

#align(
  center,
  text(font: ziti.songti, size: zihao.erhao, weight: "bold")[#info.title],
)

#v(4cm)

#let info-key(zh) = (distr(zh, w: 5em))

#let info-value(zh) = (
  text(
    zh,
    font: ziti.songti,
    size: zihao.sihao,
  )
)

#set text(font: ziti.heiti, size: zihao.sihao)
#table(
  stroke: none,
  align: (x, y) => (
    if x >= 1 {
      left
    } else {
      right
    }
  ),
  columns: (46%, 1%, 53%),
  inset: (right: 0em),
  column-gutter: (-0.3em, 1em),
  row-gutter: 0.7em,
  [#info-key("姓名")], [#text(weight: "bold")[：]], [#info-value(info.name)],
  [#info-key("学号")], [#text(weight: "bold")[：]], [#info-value(info.student_id)],
  [#info-key("导师")], [#text(weight: "bold")[：]], [#info-value(info.supervisor)],
  [#info-key("院系")], [#text(weight: "bold")[：]], [#info-value(info.school)],
  [#info-key("学科/专业")], [#text(weight: "bold")[：]], [#info-value(info.major)],
  [#info-key("申请学位")], [#text(weight: "bold")[：]], [#info-value(info.degree)],
)

#linebreak()

#align(
  center,
  text(font: ziti.songti, size: zihao.sihao, weight: "bold")[#info.date],
)

#pagebreak()

// 英文封面

#align(
  center,
  text(
    size: zihao.sihao,
    weight: "bold",
  )[
    A Dissertation Submitted to

    Shanghai Jiao Tong University for the Degree of Master
  ],
)

#v(3.1cm)

#align(
  center,
  text(
    size: zihao.xiaoer,
    weight: "bold",
  )[#info.title_en],
)

#v(3.5cm)

#let info-key-en(en) = (
  text(
    en,
    weight: "bold",
    size: zihao.sanhao,
  )
)

#let info-value-en(en) = (
  text(
    en,
    size: zihao.sanhao,
  )
)

#table(
  stroke: none,
  align: (x, y) => (
    if x == 0 {
      right
    } else {
      left
    }
  ),
  columns: (50%, 50%),
  row-gutter: 0.6em,
  [#info-key-en("Author:")], [#info-value-en(info.name_en)],
  [#info-key-en("Supervisor:")], [#info-value-en(info.supervisor_en)],
)

#v(4cm)

#let date_en(date) = (
  if date.day() == 1 or date.day() == 21 or date.day() == 31 {
    date.display("[month repr:long]") + " " + $date.display("[day]")^"st"$ + ", " + date.display("[year]")
  } else if date.day() == 2 or date.day() == 22 {
    date.display("[month repr:long]") + " " + $date.display("[day]")^"nd"$ + ", " + date.display("[year]")
  } else if date.day() == 3 or date.day() == 23 {
    date.display("[month repr:long]") + " " + $date.display("[day]")^"rd"$ + ", " + date.display("[year]")
  } else {
    date.display("[month repr:long]") + " " + $date.display("[day]")^"th"$ + ", " + date.display("[year]")
  }
)

#align(
  center,
  text(size: zihao.sanhao)[
    #info.school_en

    Shanghai Jiao Tong University

    Shanghai, P.R. China

    #date_en(date)
  ],
)

#pagebreak()

// 学位论文原创性声明以及学位论文使用授权书

#align(
  center,
  text(
    font: ziti.heiti,
    size: zihao.sanhao,
    weight: "bold",
  )[
    上海交通大学

    学位论文原创性声明
  ],
)

#set text(font: ziti.songti, size: zihao.xiaosi)
#set par(first-line-indent: 2em, leading: 16pt, spacing: 16pt)

#v(1em)

本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全知晓本声明的法律后果由本人承担。

#linebreak()

#align(
  right,
  text()[
    学位论文作者签名：#h(6.6em)

    日期：#h(2em) 年 #h(1.5em) 月 #h(1.5em) 日 #h(3.9em)
  ],
)

#v(3em)

#align(
  center,
  text(
    font: ziti.heiti,
    size: zihao.sanhao,
    weight: "bold",
  )[
    上海交通大学

    学位论文使用授权书
  ],
)

#v(1em)

本人同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。

#v(0.3em)

#h(-2em) 本学位论文属于：

$square$ *公开论文*

$square$ *内部论文*，保密 $square$ 1年/ $square$ 2年/ $square$ 3年，过保密期后适用本授权书。

$square$ *秘密论文*，保密#uline(2.5em)[]年（不超过10年），过保密期后适用本授权书。

$square$ *机密论文*，保密#uline(2.5em)[]年（不超过20年），过保密期后适用本授权书。

#h(6em) （请在以上方框内选择打“$checkmark$”）

#linebreak()

#columns(2)[
  #align(
    right,
    text()[
      学位论文作者签名：#h(6.6em)

      日期：#h(2em) 年 #h(1.5em) 月 #h(1.5em) 日 #h(3.9em)
    ],
  )
  #colbreak()
  #align(
    right,
    text()[
      指导教师签名：#h(8.6em)

      日期：#h(2em) 年 #h(1.5em) 月 #h(1.5em) 日 #h(3.9em)
    ],
  )
]

#show footnote.entry: set text(font: ziti.songti, size: zihao.xiaowu)

#show: no-numbering-page-header

#set page(header-ascent: 0.5cm)
#set par(justify: true)
#set page(numbering: "I")
#counter(page).update(1)

#set figure.caption(separator: [#h(1em)])
#show figure.where(kind: "image"): set text(size: zihao.wuhao, weight: "bold")
#show figure.where(kind: "image-en"): set text(size: zihao.wuhao, weight: "bold")
#show figure.where(kind: "table"): set text(size: zihao.wuhao, weight: "bold")
#show figure.where(kind: "table-en"): set text(size: zihao.wuhao, weight: "bold")
#show figure.where(kind: "table"): set figure.caption(position: top)
#show figure.where(kind: "table-en"): set figure.caption(position: top)
#show figure: set block(breakable: true)
#let xubiao = state("xubiao")

#show table: set text(size: zihao.wuhao, weight: "regular")
#show table: set par(leading: 14pt)
#set table(stroke: (x, y) => {
  if y == 0 {
    none
  } else {
    none
  }
})
#show table: it => xubiao.update(false) + it

#set math.equation(supplement: [公式])

= 摘#h(1em)要

学位论文是研究生从事科研工作的成果的主要表现，集中表明了作者在研究工作中获得的新的发明、理论或见解，是研究生申请硕士或博士学位的重要依据，也是科研领域中的重要文献资料和社会的宝贵财富。

为了提高研究生学位论文的质量，做到学位论文在内容和格式上的规范化与统一化，特制作本模板。

#linebreak()

#h(-2em) *关键词*：学位论文，论文格式，规范化，模板

= Abstract

#set par(first-line-indent: 1.5em)

As a primary means of demonstrating research findings for postgraduate students, dissertation is a systematic and standardized record of the new inventions, theories or insights obtained by the author in the research work. It can not only function as an important reference when students pursue further studies, but also contribute to scientific research and social development.

This template is therefore made to improve the quality of postgraduates’ dissertations and to further standardize it both in content and in format.

#linebreak()

#h(-1.5em) *Key words:* dissertation, dissertation format, standardization, template

#set par(first-line-indent: 2em)

= 目#h(1em)录

#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.typst,
  font-weight: ("bold", auto),
)

#context outline(
  title: none,
  target: selector(heading).after(here()),
  indent: 2em,
  depth: 3,
)

#set page(numbering: "1")
#counter(page).update(1)

#show: main-text-page-header
#show: main-text-first-heading
#show: other-heading

= 绪论

== 引言

学位论文......

=== 三级标题

......

==== 四级标题

......

== 本文研究主要内容

本文......

== 本文研究意义

本文......

== 本章小结

本文......

= 格式要求

== 论文正文

论文正文是主体，一般由标题、文字叙述、图、表格和公式等部分构成。一般可包括理论分析、计算方法、实验装置和测试方法，经过整理加工的实验结果分析和讨论，与理论计算结果的比较以及本研究方法与已有研究方法的比较等，因学科性质不同可有所变化。

论文内容一般应由十个主要部分组成，依次为：1. 封面，2. 中文摘要，3. 英文摘要，4. 目录，5. 符号说明，6. 论文正文，7. 参考文献，8. 附录，9. 致谢，10. 攻读学位期间发表的学术论文目录。

以上各部分独立为一部分，每部分应从新的一页开始，且纸质论文应装订在论文的右侧。

== 字数要求

=== 硕士论文要求

各学科和学院自定。

=== 博士论文要求

各学科和学院自定。

== 其他要求

=== 页面设置

页边距：上3.5厘米，下4厘米，左右均为2.5厘米，装订线靠左0.5厘米位置。

页眉：2.5厘米。页脚：3厘米。

无网格。

=== 字体

英文与数字字体要求为Times New Roman。如果英文与数字夹杂出现在黑体中文中，则将英文与数字采用Times New Roman字体再加粗。

== 本章小结

本章介绍了......

= 图表、公式格式

== 图表格式

#figure(
  figure(
    image(
      "figures/example.png",
      width: 70%,
    ),
    gap: 2em,
    kind: "image-en",
    supplement: [Figure],
    caption: [Energy distribution along radial],
  ),
  gap: -2.3em,
  kind: "image",
  supplement: [图],
  caption: [内热源沿径向的分布],
)<image>
#v(1.5em)

如 @img:image 所示，......

我们来看 @tbl:table，

#figure(
  figure(
    table(
      columns: (25%, 25%, 25%, 25%),
      table.header(
        table.cell(
          colspan: 4,
          {
            context if xubiao.get() {
              align(left)[*续@tbl:table*]
            } else {
              v(-0.9em)
              xubiao.update(true)
            }
          },
        ),
        table.hline(),
        [感应频率 #linebreak() (kHz)],
        [感应发生器功率 #linebreak() (%×80kW)],
        [工件移动速度 #linebreak() (mm/min)],
        [感应圈与零件间隙 #linebreak() (mm)],
        table.hline(stroke: 0.5pt),
      ),
      ..for i in range(15) {
        ([250], [88], [5900], [1.65])
      },
      table.hline(),
    ),
    kind: "table-en",
    supplement: [Table],
    caption: [XXXX],
  ),
  gap: 1em,
  kind: "table",
  supplement: [表],
  caption: [高频感应加热的基本参数],
)<table>

== 公式格式

我要引用 @eqt:equation。

$ 1 / mu nabla^2 Alpha - j omega sigma Alpha - nabla(1/mu) times (nabla times Alpha) + J_0 = 0 $<equation>

== 本章小结

本章介绍了……

= 全文总结

== 主要结论

本文主要……

== 研究展望

更深入的研究……

#show: no-numbering-page-header
#show: no-numbering-first-heading

#bibliography(
  "ref.bib",
  title: "参考文献",
  style: "gb-7714-2015-numeric",
  full: true,
)

#show: appendix-page-header
#show: appendix-first-heading

= 实验环境

== 硬件配置

......

== 软件工具

......

#show: no-numbering-page-header
#show: no-numbering-first-heading

= 致#h(1em)谢

致谢主要感谢导师和对论文工作有直接贡献和帮助的人士和单位。致谢言语应谦虚诚恳，实事求是。

= 学术论文和科研成果目录

#let bibitem(body) = figure(kind: "bibitem", supplement: none, body)
#show figure.where(kind: "bibitem"): it => {
  set align(left)
  set text(size: zihao.wuhao)
  box(width: 2em, it.counter.display("[1]"))
  it.body
  parbreak()
}
#show ref: it => {
  let e = it.element
  if e.func() == figure and e.kind == "bibitem" {
    let loc = e.location()
    return link(loc, numbering("[1]", ..e.counter.at(loc)))
  }
  it
}
#show list: set text(font: ziti.heiti, weight: "bold")

- 学术论文
#bibitem[Chen H, Chan C T. Acoustic cloaking in three dimensions using acoustic metamaterials[J]. Applied Physics Letters, 2007, 91:183518.] <ref1>
#bibitem[Chen H, Wu B I, Zhang B, et al. Electromagnetic Wave Interactions with a Metamaterial Cloak[J]. Physical Review Letters, 2007, 99(6):63903.] <ref2>

- 专利
#bibitem[第一发明人, 永动机[P], 专利申请号202510149890.0.] <ref3>