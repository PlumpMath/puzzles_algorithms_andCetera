// Generated by CoffeeScript 1.10.0
(function() {
  var c, find_adj, find_adj_to_set, find_shortest_path, parse_input, run_test_case;

  c = function() {
    return console.log.apply(console, arguments);
  };

  Array.prototype.clone = function() {
    return this.slice(0);
  };

  find_adj = function(s, edges, acc) {
    var edge, idx, s_idx;
    idx = 0;
    while (idx < edges.length) {
      edge = edges[idx];
      s_idx = edge.indexOf(s);
      switch (s_idx) {
        case 0:
          edges.splice(idx, 1);
          acc.push(edge[1]);
          arguments.callee(s, edges, acc);
          break;
        case 1:
          edges.splice(idx, 1);
          acc.push(edge[0]);
          arguments.callee(s, edges, acc);
      }
      idx++;
    }
    return {
      acc: acc,
      edges: edges
    };
  };

  find_adj_to_set = function(sett, edges) {
    var acc, adj_node, i, j, len, len1, node, ref, union;
    union = [];
    for (i = 0, len = sett.length; i < len; i++) {
      node = sett[i];
      if (edges.length > 0) {
        ref = find_adj(node, edges, []), acc = ref.acc, edges = ref.edges;
        for (j = 0, len1 = acc.length; j < len1; j++) {
          adj_node = acc[j];
          if (union.indexOf(adj_node) === -1) {
            union.push(adj_node);
          }
        }
      }
    }
    return union;
  };

  find_shortest_path = function(s, n, edges) {
    var distance, last, pre, union;
    distance = 0;
    union = [s];
    last = edges.length + 1;
    while ((edges.length > 0) && (edges.length < last)) {
      distance++;
      pre = find_adj_to_set(union, edges);
      union = union.concat(pre);
      last = edges.length;
      if (union.indexOf(n) !== -1) {
        return {
          found: true,
          distance: distance
        };
      }
    }
    return {
      found: false
    };
  };

  run_test_case = function(test_case) {
    var M, N, S, contents, distance, edges, i, n, output, ref, shortest_path;
    contents = test_case.contents, edges = test_case.edges, S = test_case.S;
    N = parseInt(contents[0]);
    M = parseInt(contents[1]);
    output = '';
    for (n = i = 1, ref = N; 1 <= ref ? i <= ref : i >= ref; n = 1 <= ref ? ++i : --i) {
      if (n !== S) {
        shortest_path = find_shortest_path(S, n, edges.clone());
        if (shortest_path.found === true) {
          distance = shortest_path.distance * 6;
        } else {
          distance = -1;
        }
        output = output + distance + ' ';
      }
    }
    return output;
  };

  parse_input = function(input) {
    var M, N, S, T, contents, edges, i, idx, line, output, pair, rayy, ref, ref1, ref2, x, y;
    rayy = input.split('\n');
    T = rayy.shift();
    output = '';
    while (rayy.length > 0) {
      contents = (ref = rayy.shift().split(' '), N = ref[0], M = ref[1], ref);
      edges = [];
      for (idx = i = 1, ref1 = M; 1 <= ref1 ? i <= ref1 : i >= ref1; idx = 1 <= ref1 ? ++i : --i) {
        pair = (ref2 = rayy.shift().split(' '), x = ref2[0], y = ref2[1], ref2);
        pair = [parseInt(pair[0]), parseInt(pair[1])];
        edges.push(pair);
      }
      S = parseInt(rayy.shift());
      line = run_test_case({
        contents: contents,
        edges: edges,
        S: S
      });
      output = output + line + '\n';
    }
    return c(output);
  };

}).call(this);