#import "style.typ": zihao, ziti
#import "utils.typ": align-enum-marker-with-baseline
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/outrageous:0.1.0"

#set heading(hanging-indent: 1.5em)
#show heading: it => {
  show h.where(amount: 0.3em): none
  it
}
#show heading.where(level: 1): it => {
  pagebreak()
  v(24pt)
  it
  v(18pt)
  h(2em)
}
#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set text(font: ziti.heiti, weight: "bold", size: zihao.sanhao)

#set page(margin: (top: 3.5cm, bottom: 4cm, left: 3cm, right: 2.5cm))
#set text(hyphenate: false, font: ziti.songti)
#set par(leading: 20pt)

#show: align-enum-marker-with-baseline
#show: show-cn-fakebold

#show link: it => {
  underline(text(rgb(0, 0, 255), it))
}
#show bibliography: set par(hanging-indent: 0em)
#show table: set align(center)

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

#set page(
  header: context {
    set text(font: ziti.songti, size: zihao.xiaowu)
    set par(leading: 12pt)

    // 获取当前标题内容
    let headingTitle = ""
    let headingNumber = ""

    // 对章节第一页做特殊处理，因为制作章节第一页的页眉时，当前章节标题还没出现
    // 所以 query 中使用 after(here())
    // 同时要 filter 出当前页的，不能把后面章节标题弄进来了
    let elems = query(selector(heading.where(level: 1)).after(here()))
                  .filter(it => it.location().page() == here().page())

    if elems.len() != 0 {
      // 如果 filter 出来的结果非空，意味着我们就在章节首页
      // 在制作页眉时当前章节标题还没出现，因此章节编号要加上 1
      headingTitle = elems.last().body
    } else {
      // 如果 filter 出来的结果为空，意味着我们就在章节中间
      // 重新使用 before(here()) 进行 query 来查询章节标题
      elems = query(selector(heading.where(level: 1)).before(here()))
      headingTitle = elems.last().body
    }

    // 奇数页和偶数页的页眉是对称的
    if calc.odd(counter(page).get().first()) {
      // 奇数页左边是论文名称，右边是章节标题
      "上海交通大学硕士学位论文"
      h(1fr)
      headingTitle
    } else {
      // 偶数页对称过来
      headingTitle
      h(1fr)
      "上海交通大学硕士学位论文"
    }

    // 画出页眉的两条线，一粗一细
    v(-10pt)
    line(length: 100%, stroke: 2.2416pt)
    v(-13pt)
    line(length: 100%, stroke: 0.7472pt)
  },
)

#set page(header-ascent: 0.5cm)
#set par(justify: true)
#set page(numbering: "I")
#counter(page).update(1)

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

#set heading(
  numbering: numbly(
    "第{1}章 ",
    "{1}.{2} ",
    "{1}.{2}.{3} ",
    "{1}.{2}.{3}.{4} ",
  ),
)

#show heading.where(level: 1): it => {
  set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sanhao
  )
  set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
  //前后间距分别为24磅和6磅
  pagebreak()
  v(24pt)
  counter(heading).display() + h(1em) + it.body
  v(18pt)
}

#show heading.where(level: 2): it => {
  set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sihao
  )
  set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
  //前后间距分别为24磅和6磅
  v(24pt)
  counter(heading).display() + h(1em) + it.body
  v(6pt)
}


// 设置三级标题
#show heading.where(level: 3): it => {
  set text(
    // 数字用 Times Roman，中文用黑体，均为小四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.xiaosi
  )
  set par(
    // 无缩进，行距16磅
    first-line-indent: 0em,
    leading: 16pt
  )
  //前后间距分别为12磅和6磅
  v(12pt)
  counter(heading).display() + h(1em) + it.body
  v(6pt)
}

// 设置四级标题
#show heading.where(level: 4): it => {
  set text(
    // 小四号字，不加粗，字体与正文一致
    weight: "regular",
    size: zihao.xiaosi
  )
  set par(
    // 无缩进，行距16磅
    first-line-indent: 0em,
    leading: 16pt
  )
  //前后间距分别为6磅和6磅
  v(6pt)
  counter(heading).display() + h(1em) + it.body
  v(6pt)
}

#set page(numbering: "1")
#set page(
  header: context {
    set text(font: ziti.songti, size: zihao.xiaowu)
    set par(leading: 12pt)

    // 获取当前标题内容
    let headingTitle = ""
    let headingNumber = ""

    // 对章节第一页做特殊处理，因为制作章节第一页的页眉时，当前章节标题还没出现
    // 所以 query 中使用 after(here())
    // 同时要 filter 出当前页的，不能把后面章节标题弄进来了
    let elems = query(selector(heading.where(level: 1)).after(here()))
                  .filter(it => it.location().page() == here().page())

    if elems.len() != 0 {
      // 如果 filter 出来的结果非空，意味着我们就在章节首页
      // 在制作页眉时当前章节标题还没出现，因此章节编号要加上 1
      headingTitle = elems.last().body
      headingNumber = "第" + str(counter(heading).get().first() + 1) + "章"
    } else {
      // 如果 filter 出来的结果为空，意味着我们就在章节中间
      // 重新使用 before(here()) 进行 query 来查询章节标题
      elems = query(selector(heading.where(level: 1)).before(here()))
      headingTitle = elems.last().body
      headingNumber = "第" + str(counter(heading).get().first()) + "章"
    }

    // 奇数页和偶数页的页眉是对称的
    if calc.odd(counter(page).get().first()) {
      // 奇数页左边是论文名称，右边是章节标题
      "上海交通大学硕士学位论文"
      h(1fr)
      headingNumber
      h(1em)
      headingTitle
    } else {
      // 偶数页对称过来
      headingNumber
      h(1em)
      headingTitle
      h(1fr)
      "上海交通大学硕士学位论文"
    }

    // 画出页眉的两条线，一粗一细
    v(-10pt)
    line(length: 100%, stroke: 2.2416pt)
    v(-13pt)
    line(length: 100%, stroke: 0.7472pt)
  },
)

#counter(page).update(1)

= 绪论

== 引言

学位论文……

=== 三级标题

……

==== 四级标题

……

== 本文研究主要内容

本文……

== 本文研究意义

本文……

== 本章小结

本文……

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

本章介绍了……

= 图表、公式格式

== 图表格式

