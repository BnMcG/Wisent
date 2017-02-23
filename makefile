wisent.tab.cpp wisent.tab.hpp: wisent.y
	bison -d wisent.y -o wisent.tab.cpp

wisent.yy.cpp: wisent.lex wisent.tab.hpp
	flex -o wisent.yy.cpp wisent.lex

wisent: wisent.yy.cpp wisent.tab.cpp wisent.tab.hpp
	g++ wisent.tab.cpp wisent.yy.cpp -o wisent -ll

clean:
	rm -rf wisent.yy.cpp wisent.tab.cpp wisent.tab.hpp wisent
