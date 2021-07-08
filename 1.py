s='''

	input wire clk,
	input wire reset
'''

bg='$$\\begin{array}{|c|c|c|c|c|}\n\hline\n名称&长度&方向&属性&描述\\\\\n\\hline'
ed='\\end{array}$$'

import re
a=[i for i in s.split('\n') if i!='' and '//' not in i]

print(bg)
for i in a:
	while i.startswith('\t'):
		i=i[1:]
	while i.endswith(','):
		i=i[:-1]

	b=i.split(' ')
	ans=list()
	ans.append('\\tt '+b[-1].replace('_','\\_'))
	c=re.findall('[0-9]+\:',i)+['0:',]
	ans.append(str(1+int(c[0][:-1])))
	ans.append('\\tt '+b[0])
	ans.append('\\tt '+b[1])
	qwq=''
	if b[-1]=='clk':
		qwq='时钟'
	if b[-1]=='reset':
		qwq='重置'
	if b[-1]=='wd':
		qwq='输入数据'
	if b[-1].startswith('rd'):
		qwq='输出数据'
	ans.append(qwq+'\\\\\n\\hline')
	print('&'.join(ans))
	

print(ed)