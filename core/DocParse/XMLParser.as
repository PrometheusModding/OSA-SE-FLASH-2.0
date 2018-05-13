
class XMLParser
{
	function XMLParser()
	{
	}

	public function toXML(o, isCompressed, level)
	{
		if (level == undefined)
		{
			level = 0;
		}
		else
		{
			level++;
		}
		var s = "";
		var tab = "";
		var newLine = "";
		if (!isCompressed)
		{
			newLine = "\n";
			for (var i = 0; i < level; i++)
			{
				tab += "\t";
			}
		}

		var nodeStack = [];
		for (var i in o)
		{
			nodeStack.push(i);
		}
		for (var i in nodeStack)
		{
			if (typeof o[nodeStack[i]] == "object")
			{
				for (var k = 0; k < o[nodeStack[i]].length; k++)
				{
					var node = "";
					node = tab + "<" + nodeStack[i] + populateAttributes(o[nodeStack[i]][k]);
					var subContent = toXML(o[nodeStack[i]][k], isCompressed, level);
					if (subContent)
					{
						node += ">" + newLine + subContent;
						node += tab + "</" + nodeStack[i] + ">" + newLine;
					}
					else
					{
						node += "/>" + newLine;
					}
					s = s + node;

				}
			}
		}

		return s;
	}

	private function populateAttributes(o)
	{
		var s = "";
		for (var i in o)
		{
			if (typeof o[i] != "object")
			{
				s += " " + i + '="' + o[i] + '"';
			}
		}

		return s;
	}

	private function getTopNodeContent(s)
	{
		var nodeStart = 0;
		while (s.charAt(nodeStart) != "<")
		{
			nodeStart++;
		}
		var nodeEnd = nodeStart;
		while (s.charAt(nodeEnd) != ">")
		{
			nodeEnd++;
		}
		return s.substring(nodeStart + 1, nodeEnd);
	}

	private function removeFirstNode(s)
	{
		var i = 0;
		while (s.charAt(i) != ">")
		{
			i++;
		}
		return s.substring(i + 1);
	}

	private function parseXML(s, whiteSpaceRemoved)
	{
		if (!whiteSpaceRemoved)
		{
			s = removeWhiteSpace(s);
		}
		var o = {};
		//trace(s);
		var master = s;

		while (master != "")
		{
			var top_node_content = getTopNodeContent(master);
			var top_node_name = top_node_content.split(" ")[0];
			var top_node = "<" + top_node_content + ">";

			if (top_node_content.charAt(top_node_content.length - 1) != "/")
			{
				var end_node = "</" + top_node_name + ">";
				var post_node_text = removeFirstNode(master);

				var dupe_array = post_node_text.split(top_node_name);
				var open_node = 0;
				var close_node = 0;
				var i = 0;

				while (open_node >= close_node)
				{
					var endCharacter = dupe_array[i].substr(-1, 1);
					if (endCharacter == "<")
					{
						open_node++;
					}
					else if (endCharacter == "/")
					{
						close_node++;
					}
					i++;
				}

				var child_text = removeFirstNode(master);
				child_text = child_text.split(end_node, close_node + 1);
				child_text.pop();
				child_text = child_text.join(end_node);

			}
			else
			{
				end_node = "";
				child_text = "";
			}

			if (o[top_node_name] == undefined)
			{
				o[top_node_name] = [];
			}

			if (child_text)
			{
				o[top_node_name].push(parseXML(child_text, true));
			}
			else
			{
				o[top_node_name].push({});
			}

			var node_content_array = top_node_content.split("\"");

			if (node_content_array.length > 1)
			{
				for (var i = 0; i <= node_content_array.length - 2; i = i + 2)
				{
					var aName = node_content_array[i].split(" ")[1].split("=")[0];
					var aValue = node_content_array[i + 1];

					o[top_node_name][o[top_node_name].length - 1][aName] = aValue;
				}
			}
			var removeTag = top_node + child_text + end_node;
			var removeLength = removeTag.length;
			master = master.substring(removeLength);
		}

		return o;
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
			if (subjectChar == " " or subjectChar == "\t" or subjectChar == "\n" or subjectChar == "\r")
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
			if (subjectChar == " " or subjectChar == "\t" or subjectChar == "\n" or subjectChar == "\r")
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

	private function removeWhiteSpace(s)
	{
		var closeTagArray = s.split(">");
		var i = 0;
		while (closeTagArray[i] != undefined)
		{
			closeTagArray[i] = trim(closeTagArray[i]);
			i++;
		}
		var finalText = closeTagArray.join(">");
		return finalText;
	}
}