extends Node

# Variables
var x1
var x2

var a
var b
var c

var in1
var in2
var in3
var in4
var in5

var ans1
var ans2
var ans3
var ans4
var ans5

var num
var totNum

var factoring
var squareRoot
var completeSquare
var quadratic

var aFactors = []
var bFactors = []
var cFactors = []
var matchFactors = []
var primeNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997]

func _on_start_button_pressed():
	num = 1
	$ErrorText.text = ""
	
	a = int($A.text)
	b = int($B.text)
	c = int($C.text)
	
	if ($A.text == "" or $B.text == "" or $C.text == ""):
		$ErrorText.text = "Please enter values for a, b, and c"
		return
	
	if (a == 0):
		$ErrorText.text == "Please enter a quadratic equation"
		return
	
	if ($MethodButton.selected == 0):
		$ErrorText.text = "Please select a solving method"
		return
	
	quadraticCheck(a, b, c)
	
	ans(a, b, c)
	
	if ($MethodButton.selected == 1):
		factoringCheck(a, b, c)
		if (factoring == false):
			$ErrorText.text = "Factoring does not work for the inputted values"
			return
		factors(a, aFactors)
		factors(b, bFactors)
		factors(c, cFactors)
		gcf()
		factoringSteps()
		return
	
	if ($MethodButton.selected == 2):
		squareRootCheck(a, b, c)
		if (squareRoot == false):
			$ErrorText.text = "Square Root Property does not work for the inputted values"
			return
		squareRootSteps()
		return
	
	if ($MethodButton.selected == 3):
		completeSquareCheck(a, b, c)
		if (completeSquare == false):
			$ErrorText.text = "Complete the Square does not work for the inputted values"
			return
		completeSquareSteps()
		return
	
	if ($MethodButton.selected == 4):
		if (quadratic == false):
			$ErrorText.text = "Quadratic Equation does not work for the inputted values (imaginary results)"
			return
		quadraticSteps()
		return

func factoringCheck(a, b, c):
	if ((int(x1)*10) % 10 != 0):
		factoring = false
		return
	if ((int(x2)*10) % 10 != 0):
		factoring = false
		return
	if (quadratic == false):
		factoring = false
		return
	factoring = true

func squareRootCheck(a, b, c):
	if (b != 0):
		squareRoot = false
		return
	if ((x1*10) % 10 != 0):
		squareRoot = false
		return
	if ((x2*10) % 10 != 0):
		squareRoot = false
		return
	if (quadratic == false):
		squareRoot = false
		return
	squareRoot = true

func completeSquareCheck(a, b, c):
	if ((x1*10) % 10 != 0):
		completeSquare = false
		return
	if ((x2*10) % 10 != 0):
		completeSquare = false
		return
	if (quadratic == false):
		completeSquare = false
		return
	completeSquare = true

func quadraticCheck(a, b, c):
	if (b**2 - (4 * a * c) < 0):
		quadratic = false
	else:
		quadratic = true

func ans(a, b, c):
	x1 = (-b + sqrt(b**2 - (4 * a * c))) / (2 * a)
	x2 = (-b - sqrt(b**2 - (4 * a * c))) / (2 * a)
	
	print(str(x1) + " " + str(x2))

func factors(val, array):
	var editVal = val
	var curPrime = 0
	
	array.append(editVal)
	array.append(val/editVal)
	
	while (editVal != 1):
		if (editVal % primeNumbers[curPrime] == 0):
			editVal = editVal / primeNumbers[curPrime]
			if (editVal != 1):
				array.append(editVal)
				array.append(val/editVal)
			curPrime = 0
		else:
			curPrime += 1
	print(array)

func gcf():
	for n in aFactors.size():
		for m in bFactors.size():
			for o in cFactors.size():
#				print(str(n) + " " + str(m) + " " + str(o))
				if (aFactors[n] == bFactors[m] and aFactors[n] == cFactors[o]):
					matchFactors.append(aFactors[n])

func factoringSteps():
	$StepLabel.show()
	$Check.show()
	$MethodButton.disabled = true
	$StartButton.hide()
	$A.editable = false
	$B.editable = false
	$C.editable = false
	
	totNum = 3
	
	if (num == 1):
		$Factoring/Step1/Equation.show()
		$Factoring/Step1/Exponent.show()
		$Factoring/Step1/In1.show()
		$Factoring/Step1/In2.show()
		$Factoring/Step1/In3.show()
		$Factoring/Step1/In4.show()
		
		$StepLabel.text = "Step 1: Factor out the greatest common factor (if the gcf is 1 still put 1)"
		
		ans1 = matchFactors.max()
		ans2 = a / matchFactors.max()
		ans3 = b / matchFactors.max()
		ans4 = c / matchFactors.max()
		ans5 = null
	
	if (num == 2):
		$Factoring/Step1/Equation.hide()
		$Factoring/Step1/Exponent.hide()
		$Factoring/Step1/In1.hide()
		$Factoring/Step1/In2.hide()
		$Factoring/Step1/In3.hide()
		$Factoring/Step1/In4.hide()
		
		$Factoring/Step2/Equation.show()
		$Factoring/Step2/Factors1.show()
		$Factoring/Step2/Factors2.show()
		$Factoring/Step2/In1.show()
		$Factoring/Step2/In2.show()
		
		print(str(c) + " " + str(matchFactors.max()))
		print(str(c/matchFactors.max()))
		$Factoring/Step2/Factors1.text = "Factors of " + str(c/matchFactors.max()) + ":"
		for n in cFactors.size()/2:
			print("Entered 1st for loop")
			if ((int((cFactors[n] / matchFactors.max())) * 10) % 10 == 0 and int(((cFactors[n+1] / matchFactors.max())) * 10) % 10 == 0):
				print("Entered if statement")
				$Factoring/Step2/Factors2.text += str(cFactors[n] / matchFactors.max()) + " and " + str(cFactors[n+1] / matchFactors.max()) + ", "
		
		$StepLabel.text = "Step 2: Find factors of c that add up to a + b"
		
		for n in cFactors.size()/2:
			print("Entered 2nd for loop")
#			((cFactors[n] / matchFactors.max()) * 10) % 10 == 0 and ((cFactors[n+1] / matchFactors.max()) * 10) % 10 == 0 and 
			if ((cFactors[n] / matchFactors.max() + cFactors[n+1] / matchFactors.max()) == (a / matchFactors.max() + b / matchFactors.max())):
				print("Entered 2nd if statement")
				ans1 = cFactors[n] / matchFactors.max()
				ans2 = cFactors[n+1] / matchFactors.max()
				print("Answers: " + str(cFactors[n] / matchFactors.max()) + " " + str(cFactors[n+1] / matchFactors.max()))
		ans3 = null
		ans4 = null
		ans5 = null
	
	if (num == 3):
		$Factoring/Step2/Equation.hide()
		$Factoring/Step2/Factors1.hide()
		$Factoring/Step2/Factors2.hide()
		$Factoring/Step2/In1.hide()
		$Factoring/Step2/In2.hide()
		
		$Factoring/Step3/Equation.show()
		$Factoring/Step3/In1.show()
		$Factoring/Step3/In2.show()
		$Factoring/Step3/In3.show()
		$Factoring/Step3/In4.show()
		
		$StepLabel.text = "Step 3: Solve for x"
		
		ans1 = -x1
		ans2 = x1
		ans3 = -x2
		ans4 = x2
		ans5 = null

func squareRootSteps():
	pass

func completeSquareSteps():
	pass

func quadraticSteps():
	$StepLabel.show()
	$Check.show()
	$MethodButton.disabled = true
	$StartButton.hide()
	$A.editable = false
	$B.editable = false
	$C.editable = false
	
	totNum = 3
	
	if (num == 1):
		# Step 1
		$"Quadratic Formula/Step1/QuadraticEquation1".show()
		$"Quadratic Formula/Step1/QuadraticEquation2".show()
		$"Quadratic Formula/Step1/Exponent".show()
		$"Quadratic Formula/Step1/In1".show()
		$"Quadratic Formula/Step1/In2".show()
		$"Quadratic Formula/Step1/In3".show()
		$"Quadratic Formula/Step1/In4".show()
		$"Quadratic Formula/Step1/In5".show()
		
		$StepLabel.text = "Step 1: Substitute the values of a, b, and c into the quadratic formula"
		
		ans1 = -b
		ans2 = b
		ans3 = a
		ans4 = a
		ans5 = c
	
	if (num == 2):
		$"Quadratic Formula/Step1/QuadraticEquation1".hide()
		$"Quadratic Formula/Step1/QuadraticEquation2".hide()
		$"Quadratic Formula/Step1/Exponent".hide()
		$"Quadratic Formula/Step1/In1".hide()
		$"Quadratic Formula/Step1/In2".hide()
		$"Quadratic Formula/Step1/In3".hide()
		$"Quadratic Formula/Step1/In4".hide()
		$"Quadratic Formula/Step1/In5".hide()
		
		$"Quadratic Formula/Step2/QuadraticEquation1".show()
		$"Quadratic Formula/Step2/QuadraticEquation2".show()
		$"Quadratic Formula/Step2/In1".show()
		$"Quadratic Formula/Step2/In2".show()
		$"Quadratic Formula/Step2/In3".show()
		
		$StepLabel.text = "Step 2: Simplify the fraction"
		
		ans1 = -b
		ans2 = sqrt(b**2 - (4 * a * c))
		ans3 = 2 * a
		ans4 = null
		ans5 = null
	
	if (num == 3):
		$"Quadratic Formula/Step2/QuadraticEquation1".hide()
		$"Quadratic Formula/Step2/QuadraticEquation2".hide()
		$"Quadratic Formula/Step2/In1".hide()
		$"Quadratic Formula/Step2/In2".hide()
		$"Quadratic Formula/Step2/In3".hide()
		
		$"Quadratic Formula/Step3/QuadraticEquation1".show()
		$"Quadratic Formula/Step3/QuadraticEquation2".show()
		$"Quadratic Formula/Step3/QuadraticEquation2".text = str(ans1) + " + " + str(ans2) + "\n       " + str(ans3)
		$"Quadratic Formula/Step3/QuadraticEquation3".show()
		$"Quadratic Formula/Step3/QuadraticEquation4".show()
		$"Quadratic Formula/Step3/QuadraticEquation4".text = str(ans1) + " - " + str(ans2) + "\n       " + str(ans3)
		$"Quadratic Formula/Step3/In1".show()
		$"Quadratic Formula/Step3/In2".show()
		$"Quadratic Formula/Step3/In3".show()
		$"Quadratic Formula/Step3/In4".show()
		$"Quadratic Formula/Step3/FinalAnswer".show()
		
		$StepLabel.text = "Step 3: Solve for ±"
		
		ans1 = x1
		ans2 = x1
		ans3 = x2
		ans4 = x2
		ans5 = null

func _on_check_pressed():
	match $MethodButton.selected:
		1:
			match num:
				1:
					in1 = int($Factoring/Step1/In1.text)
					in2 = int($Factoring/Step1/In2.text)
					in3 = int($Factoring/Step1/In3.text)
					in4 = int($Factoring/Step1/In4.text)
					in5 = null
				2:
					in1 = int($Factoring/Step2/In1.text)
					in2 = int($Factoring/Step2/In2.text)
					in3 = null
					in4 = null
					in5 = null
				3:
					in1 = int($Factoring/Step3/In1.text)
					in2 = int($Factoring/Step3/In2.text)
					in3 = int($Factoring/Step3/In3.text)
					in4 = int($Factoring/Step3/In4.text)
					in5 = null
		2:
			pass
		3:
			pass
		4:
			match num:
				1:
					in1 = float($"Quadratic Formula/Step1/In1".text)
					in2 = float($"Quadratic Formula/Step1/In2".text)
					in3 = float($"Quadratic Formula/Step1/In3".text)
					in4 = float($"Quadratic Formula/Step1/In4".text)
					in5 = float($"Quadratic Formula/Step1/In5".text)
				2:
					in1 = float($"Quadratic Formula/Step2/In1".text)
					in2 = float($"Quadratic Formula/Step2/In2".text)
					in3 = float($"Quadratic Formula/Step2/In3".text)
					in4 = null
					in5 = null
				3:
					in1 = float($"Quadratic Formula/Step3/In1".text)
					in2 = float($"Quadratic Formula/Step3/In2".text)
					in3 = float($"Quadratic Formula/Step3/In3".text)
					in4 = float($"Quadratic Formula/Step3/In4".text)
					in5 = null
	
	if (ans1 == in1 and ans2 == in2 and ans3 == in3 and ans4 == in4 and ans5 == in5):
		if (num == totNum):
			$Correct.text = "Correct! Click the button to ask a new question."
			$Next.hide()
			$New.show()
		else:
			$Correct.text = "Correct! Click \"Next\" to move to the next step."
			$Next.show()
	else:
		$Correct.text = "Incorrect! Please try again."
		$Next.hide()


func _on_next_pressed():
	num += 1
	$Correct.text = ""
	$Next.hide()
	
	match $MethodButton.selected:
		1:
			factoringSteps()
		2:
			squareRootSteps()
		3:
			completeSquareSteps()
		4:
			quadraticSteps()


func _on_new_pressed():
	$New.hide()
	$StepLabel.hide()
	$Check.hide()
	$MethodButton.disabled = false
	$StartButton.show()
	$Correct.text = ""
	$A.editable = true
	$B.editable = true
	$C.editable = true
	$A.text = ""
	$B.text = ""
	$C.text = ""
	
	match $MethodButton.selected:
		1:
			$Factoring/Step3/Equation.hide()
			$Factoring/Step3/In1.hide()
			$Factoring/Step3/In2.hide()
			$Factoring/Step3/In3.hide()
			$Factoring/Step3/In4.hide()
			$Factoring/Step1/In1.text = ""
			$Factoring/Step1/In2.text = ""
			$Factoring/Step1/In3.text = ""
			$Factoring/Step1/In4.text = ""
			$Factoring/Step2/In1.text = ""
			$Factoring/Step2/In2.text = ""
			$Factoring/Step3/In1.text = ""
			$Factoring/Step3/In2.text = ""
			$Factoring/Step3/In3.text = ""
			$Factoring/Step3/In4.text = ""
			$Factoring/Step2/Factors2.text = ""
			aFactors.clear()
			bFactors.clear()
			cFactors.clear()
			matchFactors.clear()
		2:
			pass
		3:
			pass
		4:
			$"Quadratic Formula/Step3/QuadraticEquation1".hide()
			$"Quadratic Formula/Step3/QuadraticEquation2".hide()
			$"Quadratic Formula/Step3/QuadraticEquation3".hide()
			$"Quadratic Formula/Step3/QuadraticEquation4".hide()
			$"Quadratic Formula/Step3/In1".hide()
			$"Quadratic Formula/Step3/In2".hide()
			$"Quadratic Formula/Step3/In3".hide()
			$"Quadratic Formula/Step3/In4".hide()
			$"Quadratic Formula/Step3/FinalAnswer".hide()
			$"Quadratic Formula/Step1/In1".text = ""
			$"Quadratic Formula/Step1/In2".text = ""
			$"Quadratic Formula/Step1/In3".text = ""
			$"Quadratic Formula/Step1/In4".text = ""
			$"Quadratic Formula/Step1/In5".text = ""
			$"Quadratic Formula/Step2/In1".text = ""
			$"Quadratic Formula/Step2/In2".text = ""
			$"Quadratic Formula/Step2/In3".text = ""
			$"Quadratic Formula/Step3/In1".text = ""
			$"Quadratic Formula/Step3/In2".text = ""
			$"Quadratic Formula/Step3/In3".text = ""
			$"Quadratic Formula/Step3/In4".text = ""
	
	$MethodButton.selected = 0
