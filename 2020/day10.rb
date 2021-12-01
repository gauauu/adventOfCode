input = <<-endstr
83
69
170
56
43
111
117
135
136
176
154
65
107
169
141
151
158
134
108
143
114
104
49
55
72
73
144
13
35
152
98
133
31
44
150
70
118
64
39
137
142
28
130
167
101
100
120
79
153
157
89
163
177
3
1
38
16
128
18
62
76
78
17
63
160
59
175
168
54
34
22
174
53
25
129
90
42
119
92
173
4
166
19
2
121
7
71
99
66
46
124
86
127
159
12
91
140
52
80
45
33
9
8
77
147
32
95
endstr

# input = <<-endstr
# 28
# 33
# 18
# 42
# 31
# 14
# 46
# 20
# 48
# 47
# 24
# 23
# 49
# 45
# 19
# 38
# 39
# 11
# 1
# 32
# 25
# 35
# 8
# 17
# 7
# 9
# 4
# 2
# 34
# 10
# 3
# endstr

# input = <<-endstr
# 16
# 10
# 15
# 5
# 1
# 11
# 7
# 19
# 6
# 12
# 4
# endstr

$numbers = input.split("\n").map(&:chomp).map(&:to_i)

$sorted = $numbers.sort
$sorted.unshift 0
$sorted << $sorted.last + 3

$cache = {}

def number_valid(from_index)
  if from_index == $sorted.length - 1
    return 1
  end

  if $cache.key? from_index
    return $cache[from_index]
  end

  current_val = $sorted[from_index]
  check_pos = from_index + 1
  total = 0

  while (check_pos < $sorted.length) && ($sorted[check_pos] <= (current_val + 3))
    total += number_valid(check_pos)
    check_pos = check_pos + 1
  end
  $cache[from_index] = total
  total

end

p number_valid(0)

