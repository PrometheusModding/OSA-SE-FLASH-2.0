
class IniParser
{
	function IniParser()
	{
	}

	public function parse(s)
	{
		var output = {};
		var lineArray = s.split("\r\n");
		for (var i = 0; i < lineArray.length; i++)
		{
			var itemArray = lineArray[i].split("=");

			if (itemArray.length == 2)
			{
				if (itemArray[1].charAt(1) == '"')
				{
					output[trim(itemArray[0])] = String(trim(itemArray[1]).split('"').join(""));
				}
				else
				{
					output[trim(itemArray[0])] = Number(trim(itemArray[1]));
				}
			}
		}
		return output;
	}

	private function trim(s)
	{
		var j, strlen, k, isWhiteSpace, subjectChar;

		strlen = s.length;
		j = 0;
		isWhiteSpace = true;
		while (isWhiteSpace)
		{
			subjectChar = s.charAt(j);
			if (subjectChar == " " || subjectChar == "\t" || subjectChar == "\n" || subjectChar == "\r")
			{
				j++;
			}
			else
			{
				isWhiteSpace = false;
			}

		}
		if (j)
		{
			s = substring(s, j + 1, strlen);
			if (j == strlen)
			{
				return s;
			}
		}

		var k = s.length - 1;
		isWhiteSpace = true;

		while (isWhiteSpace)
		{
			subjectChar = s.charAt(k);
			if (subjectChar == " " || subjectChar == "\t" || subjectChar == "\n" || subjectChar == "\r")
			{
				k--;
			}
			else
			{
				isWhiteSpace = false;
			}
		}
		s = substring(s, 1, k + 1);
		return s;
	}
}