print("Hello world from Python")

word = 'parakeet'
print("".join(["_" for w in word]))


scope = 0
def add_1(scope):
    scope += 1
add_1(scope)
print(scope)