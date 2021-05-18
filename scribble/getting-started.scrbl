#lang scribble/acmart


@title{第一个例子}
@abstract{这个是摘要的内容}
第一行的#lang scribble/base 声明一个scribble文档, at符号转移操作如title,括号里的文字是参数



@section{多段落}

第一段落文字

@section{第二段落}

第二段落文字

@section{函数@italic{演示}}

这个是@smaller{变小}的字,这个是@bold{变粗}的字,这个是@larger{变大}的字,
这个是@italic{斜体}字

@centered{
    @bold{居中字体}

    @italic{斜体字}
}

@margin-note{加一个旁边的注解}

@centered{@bold{静夜思}}

@itemlist[
    @item{床前明月光⑵，疑是地上霜⑶。}
    @item{举头望明月⑷，低头思故乡。}
]

@tabular[#:sep @hspace[8]
    (list (list @bold{第一个列} "第二列")
          (list "内容1" "内荣2"))]

@elem[#:style 'italic]{Yummy!}

@;{这个是注释}
@; 这个也是注释

@verbatim{---}

@(verbatim (number->string (+ 1 2)))

|{}|原样输出
@verbatim|{@number->string(1+2)}|

@(require pict)
This cookie has lost ites chocolate chis;
@(colorize (filled-ellipse 50 40 )"beige")
