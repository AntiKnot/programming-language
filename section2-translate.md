Coursera Programming Languages Course
Section 2 Summary

章节2摘要

Standard Description: This summary covers roughly the same material as the lecture videos and the materials (slides, code) posted with each video. It can help to read about the material in a narrative style and
to have the material for an entire section of the course in a single document, especially when reviewing the
material later. Please report errors in these notes on the discussion board.

标准说明：此摘要与每个视频中发布的材料（包括，幻灯片代码）大致相同。将课程中章节的内容打包进一个文件，在回顾材料的时候就能以叙事文的形式阅读。请在讨论区报告在这些笔记中发现的错误。

Contents
内容列表汇总
...

Conceptual Ways to Build New Types

构建心类型的概念方法

Programming languages have base types, like int, bool, and unit and compound types, which are types that
contain other types in their definition. We have already seen ways to make compound types in ML, namely
by using tuple types, list types, and option types. We will soon learn new ways to make even more flexible
compound types and to give names to our new types. To create a compound type, there are really only three
essential building blocks. Any decent programming language provides these building blocks in some way:1

编程语言有基本类型，如int，bool，unit（单元），compound types（复合类型）类型在其定义中包含其他类型，我们已经学习在ML中如何制作复合类型，亦即通过元组类型，列表类型，选项类型。我们很快将学会更灵活复合类型的新方法，并为我们新的类型命名。要创建复合类型，实际只需要三种基本模块组件。任何像样的编程语言都一某种方式提供这些构建组件。

“Each-of”: A compound type t describes values that contain each of values of type t1, t2, ..., and
tn.

each-of 复合类型t描述包含t1,t2,...tn类型的每个值的值。

“One-of”: A compound type t describes values that contain a value of one of the types t1, t2, ..., or
tn.

one-of 复合类型t描述包含t1,t2,...tn类型之一的值。

“Self-reference”: A compound type t may refer to itself in its definition in order to describe recursive
data structures like lists and trees.

self-reference 复合类型t可以在其定义中引用自身以描述递归列表和树的数据结构。

Each-of types are the most familiar to most programmers. 
Tuples are an example: int * bool describes values that contain an int and a bool. 
A Java class with fields is also an each-of sort of thing.

each-of types 是大多数程序员最熟悉的类型。
元组就是一个例子：int * bool描述包含int和bool的值。
带有字段的Java类也是each-of 一类的东西。

One-of types are also very common but unfortunately are not emphasized as much in many introductory programming courses. 
int option is a simple example: A value of this type contains an int or it does not.
For a type that contains an int or a bool in ML, we need datatype bindings, which are the main focus of
this section of the course. 
In object-oriented languages with classes like Java, one-of types are achieved with
subclassing, but that is a topic for much later in the course.

one-of types 也很常见，但遗憾的是在许多编程课程介绍中都没有强调过。 
int option 是一个简单的示例：此类型的值包含int或不包含。
对于ML中包含int或bool的类型，我们需要数据类型绑定，这是这部分课程主要的焦点。
在像Java这样的类的面向对象语言中，可以实现一种类型子类化，但这是课程后期的主题。

Self-reference allows types to describe recursive data structures. This is useful in combination with each-of
and one-of types. 
For example, int list describes values that either contain nothing or contain an int
and another int list. A list of integers in any programming language would be described in terms of or,
and, and self-reference because that is what it means to be a list of integers.
Naturally, since compound types can nest, we can have any nesting of each-of, one-of, and self-reference. For
example, consider the type (int * bool) list list * (int option) list * bool.

self-reference 允许类型描述递归数据结构。这在需要组合each-of one-of两种类型时有用。
例如，int list描述不包含任何内容或包含int的值
和另一个int列表。任何编程语言中的整数列表将以or表示。
和，以及自我引用，因为这就是整数列表的含义。
当然，由于复合类型可以嵌套，我们可以嵌套每个，一个和self-reference。例如，考虑以下，类型
```
（int * bool）list list *（int option）list * bool。
```

Records: Another Approach to “Each-of” Types

记录：“each-of”类型的另一种方法

Record types are “each-of” types where each component is a named field. For example, the type
{foo : int, bar : int*bool, baz : bool*int} describes records with three fields named foo, bar, and
baz. This is just a new sort of type, just like tuple types were new when we learned them.
A record expression builds a record value. For example, the expression
{bar = (1+2,true andalso true), foo = 3+4, baz = (false,9) } would evaluate to the record value
{bar = (3,true), foo = 7, baz = (false,9)}, which can have type
{foo : int, bar : int*bool, baz : bool*int} because the order of fields never matters (we use the
field names instead). In general the syntax for a record expression is {f1 = e1, ..., fn = en} where, as
always, each ei can be any expression. Here each f can be any field name (though each must be different).
A field name is basically any sequence of letters or numbers.
In ML, we do not have to declare that we want a record type with particular field names and field types —
we just write down a record expression and the type-checker gives it the right type. The type-checking rules
for record expressions are not surprising: Type-check each expression to get some type ti and then build
the record type that has all the right fields with the right types. Because the order of field names never
matters, the REPL always alphabetizes them when printing just for consistency.
The evaluation rules for record expressions are analogous: Evaluate each expression to a value and create
the corresponding record value.
Now that we know how to build record values, we need a way to access their pieces. For now, we will use
#foo e where foo is a field name. Type-checking requires e has a record type with a field named foo, and
if this field has type t, then that is the type of #foo e. Evaluation evaluates e to a record value and then
produces the contents of the foo field.

Record 类型，each-of类型如果每个组成都是一个被命名的字段，就是record类型，record类型是each-of条件限制得到的。


