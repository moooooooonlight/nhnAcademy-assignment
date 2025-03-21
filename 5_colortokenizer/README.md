# Color Tokenizer 작성

1. 데이터와 동작
         프로그래밍의 가장 큰 목적은 동작을 통해 데이터를 표현하거나 조작하는 것입니다. 객체 지향 프로그래밍에서, 객체는 데이터(예: 변수)와 동작(예: 메소드를 가지고 있습니다. 예를 들어서, 칼을 이용해서 요리를 하는 요리사를 클래스로 모델링하면 아래와 같이 될 수 있습니다.


         public class Chef {
               public String knife = "칼";
    
               public void Cook() {
                   System.out.println(this.knife + "로 야채를 잘라 자장면을 만듭니다");
               }
         }
    
        class Restaurant {
            public void serve(Chef chef) {
                chef.Cook();
                ...
            }
        }


      프로그램의 요구사항이 요리사가 자장면을 만드는 것에서 탕수육을 만드는 것으로 변경되는 경우를 생각해 봅시다. 클래스는 아래와 같이 변경될 수 있습니다.
        public class Chef {
            public String knife = “칼”;
        
            public void Cook() {
                System.out.println(this.knife + 로 고기를 잘라 탕수육을 만듭니다”);
            }
        }


    코드가 위와 같이 변경되면 음식점은 더 이상 자장면을 판매할 수 없게 됩니다. 이런 경우 아래와 같이 변경될 수 있습니다.


        public class Chef {
            public String knife = "칼";
        
            public void Cook자장면() {
                System.out.println(this.knife + "로 야채를 잘라 자장면을 만듭니다");
            }
        
             public void Cook탕수육() {
                System.out.println(this.knife + "로 고기를 잘라 탕수육을 만듭니다");
            }
        }
    코드가 위와 같이 변경되었을 경우 Restaurant 클래스의 코드는 아래와 같이 변경되어야 합니다.

    
        class Restaurant {
            public void serve(Chef chef, String menu) {
                if (menu == “자장면”) 
                    chef.Cook자장면();
                if (menu == “탕수육”)
                    chef.Cook탕수육();
            }
        }
    음식점 프로그램의 요구사항에 따라, 요리사는 주어진 도구를 이용하여 많은 요리를 해야 합니다. 현재의 요구사항에서는 요리사는 칼로 자장면과 탕수육만을 요리하지만, 요구사항의 변경에 따라 더 많은 요리가 추가될 경우, 코드는 수정되어야 합니다.

    이렇게 프로그램 코드에 변경이 발생했을 때 그 모듈을 이용하는 다른 모듈들을 줄줄이 고쳐야 한다면, 프로그램을 수정하기 어렵게 됩니다. 

---
2. 개방 폐쇄 원칙

    개방-폐쇄 원칙(OCI, Open and Close Principle)은 프로그램의 구조를 올바르게 재조직하여 이와 같은 유형의 변경이 더 이상의 수정을 유발하지 않도록 하는 것입니다. 개방-폐쇄 원칙이 잘 적용되면, 기능을 추가하거나 변경해야 할 때 이미 제대로 동작하고 있던 원래 코드를 변경하지 않아도 기존의 코드에 새로운 코드를 추가함으로써 기능의 추가나 변경이 용이하게 됩니다.

    개방-폐쇄 원칙의 두 가지 속성은 다음과 같습니다.

    **확장에 대해 열려 있다.**

    이것은 모듈의 동작을 확장할 수 있다는 것을 의미합니다. 응용 프로그램의 요구 사항이 변경될 때, 이 변경에 맞게 새로운 동작을 추가해 모듈을 확장할 수 있습니다. 

    **수정에 대해 닫혀 있다.**

    모듈의 소스 코드나 바이너리 코드를 수정하지 않아도 모듈의 기능을 확장하거나 변경할 수 있습니다. 그 모듈의 라이브러리(예를 들어 자바의 .jar나 .NET의 어셈블리)를 수정할 필요가 없습니다.
    객체 지향 프로그래밍 언어(Java, C#, C++ 등)에서는 고정되기는 해도 제한되지는 않은, 가능한 동작의 묶음을 표현하는 추상화가 가능합니다. 모듈은 추상화를 조작할 수 있습니다. 이런 모듈은 고정된 추상화에 의존하기 때문에 수정에 대해 닫혀 있을 수 있고, 반대로 추상화의 새 파생 클래스를 만드는 것을 통해 확장도 가능합니다. 추상화는 개방-폐쇄 원칙의 핵심 요소입니다.

---
3. 데이터와 동작의 분리

    Chef의 데이터와 동작을 분리해 봅시다. Chef는 데이터로 칼(knife)를 가지고 있으며, 동작으로 Cook()을 가지고 있습니다. 여기에서 동작을 분리하고 데이터만 남깁니다.


        public class Chef {
            private string knife = "칼";
        
            public String getStuff() {
                return this.knife;
            }
        }
    분리된 동작을 아래와 같이 만듭니다. 동작은 Chef에 의해 이루어져야 하므로, Chef를 매개변수로 받는 visit() 메소드를 정의합니다.


        public class NoodleVisitor {
            public void visit(Chef chef) {
                System.out.println(chef.getStuff() + "로 자장면을 만듭니다")”;
            }
        }
    Chef는 분리되어 정의된 동작을 수행해야 합니다. 이를 위한 accept() 메소드를 아래와 같이 Chef 클래스에 정의합니다.


        public class Chef {
            private string knife = "칼";
        
            public String getStuff() {
                return this.knife;
            }
        
            public void accept(NoodleVisitor visitor) {
                visitor.visit(this);
            }
        }

   아래와 같은 코드로 Chef에게 자장면을 만들도록 할 수 있습니다. 

    class Restaurant {
        public void serve(Chef chef, Visitor visitor) {
            chef.accept(new NoodleVisitor());
        }
    }

---
4. 동작의 추가

    위와 같은 코드에서 데이터와 동작을 분리했지만, 위와 같은 코드로는 동작을 수정없이 추가할 수 없습니다. 수정없이 객체를 추가하는 것만으로 Chef의 동작을 확장 가능하게 하려면, 데이터(Chef)와 동작(Visitor)중 최소한 하나는 널리 사용될 수 있는 타입으로 선언되어야 합니다. 


        (공용 타입 선언...)
    
        public class NoodleVisitor implements (공용 타입) {
            public void visit(Chef chef) {
                System.out.println(chef.getStuff() + “로 자장면을 만듭니다”);
            }
        }
    공용 타입으로 선언된 NoodleVisitor를 어디에 적용해야 코드의 수정없이 객체 추가만으로 Chef가 다른 요리를 할 수 있도록 할 수 있을까요?

    위와 같이 데이터와 동작을 분리하고, 동작이 추가될 때 수정없이 객체의 추가만으로 요구사항을 반영할 수 있도록 설계하는 방법은 정형화되어 있고, 이를 Visitor 패턴이라고 합니다.

---
5. Syntax Tokenizer 

    Java 소스 파일에는 많은 유형들이 포함됩니다. 많은 코드 에디터들이 소스 파일을 읽기 쉽도록 Java 소스파일에 포함되는 요소의 유형마다 색을 입힙니다. 이를 Syntax Coloring이라고 합니다.

    Java 소스 파일을 입력으로 하여 소스 파일의 요소들이 색을 입히는 동작을 하도록 할 수 있습니다. Java 소스 파일에 포함되는 요소에 색을 변경하기 위해서 프로그램을 작성한 후, 추가되는 요구사항 (예를 들면 tab이 찍힌 자리에 -> 기호를 포함한다든지 하는)이 있어도 수정이 아닌 개체의 추가만으로 요구사항이 반영되도록 프로그램을 디자인 할 수 있습니다.

---
6. 문제

    위의 요리사 예제에서 언급된 방법을 사용하여 Java 소스 파일을 입력으로 하여 Syntax Coloring된 HTML 파일을 출력하는 ColorTokenizer 프로그램을 작성하세요.
    입력 파일의 이름이 Sample.java이고 아래와 같은 경우,

        public class Sample {
            int I = 5;
        }

    아래와 같이 실행할 수 있어야 합니다.

       % java colortokenizer Sample.java

    프로그램이 위와 같은 형식으로 실행되면 Sample.html 파일이 생성되어야 하며, 파일의 내용은 아래와 같은 "형태"여야 합니다.

        <span style=”color:blue”>public</span> <span style=”color:blue”>class</span> Sample {<br> &nbsp;&nbsp;&nbsp;&nbsp; <span style=”color:blue”>int</span>i = 5; <br>}<br>
