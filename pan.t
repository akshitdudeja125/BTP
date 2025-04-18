#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(7*sizeof(Trans **));

	/* proctype 5: uniqueness */

	trans[5] = (Trans **) emalloc(11*sizeof(Trans *));

	trans[5][7]	= settr(444,0,6,1,0,".(goto)", 0, 2, 0);
	T = trans[5][6] = settr(443,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(443,0,3,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(443,0,4,0,0,"DO", 0, 2, 0);
	T = trans[ 5][3] = settr(440,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(440,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[5][1]	= settr(438,0,6,3,3,"(!((leaders<=1)))", 1, 2, 0); /* m: 2 -> 6,0 */
	reached5[2] = 1;
	trans[5][2]	= settr(0,0,0,0,0,"assert(!(!((leaders<=1))))",0,0,0);
	trans[5][4]	= settr(441,0,6,1,0,"(1)", 0, 2, 0);
	trans[5][5]	= settr(442,0,6,1,0,"goto T0_init", 0, 2, 0);
	trans[5][8]	= settr(445,0,9,1,0,"break", 0, 2, 0);
	trans[5][9]	= settr(446,0,10,1,0,"(1)", 0, 2, 0);
	trans[5][10]	= settr(447,0,0,4,4,"-end-", 0, 3500, 0);

	/* proctype 4: electionFairness */

	trans[4] = (Trans **) emalloc(28*sizeof(Trans *));

	trans[4][10]	= settr(420,0,9,1,0,".(goto)", 0, 2, 0);
	T = trans[4][9] = settr(419,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(419,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(419,0,3,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(419,0,5,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(419,0,7,0,0,"DO", 0, 2, 0);
	trans[4][1]	= settr(411,0,14,5,0,"((!(!((state[2]==3)))&&!((state[2]!=3))))", 1, 2, 0);
	trans[4][2]	= settr(412,0,14,1,0,"goto accept_S4", 0, 2, 0);
	trans[4][3]	= settr(413,0,19,6,0,"((!(!((state[1]==3)))&&!((state[1]!=3))))", 1, 2, 0);
	trans[4][4]	= settr(414,0,19,1,0,"goto accept_S25", 0, 2, 0);
	trans[4][5]	= settr(415,0,24,7,0,"((!(!((state[0]==3)))&&!((state[0]!=3))))", 1, 2, 0);
	trans[4][6]	= settr(416,0,24,1,0,"goto accept_S46", 0, 2, 0);
	trans[4][7]	= settr(417,0,9,1,0,"(1)", 0, 2, 0);
	trans[4][8]	= settr(418,0,9,1,0,"goto T0_init", 0, 2, 0);
	trans[4][11]	= settr(421,0,14,1,0,"break", 0, 2, 0);
	trans[4][15]	= settr(425,0,14,1,0,".(goto)", 0, 2, 0);
	T = trans[4][14] = settr(424,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(424,0,12,0,0,"DO", 0, 2, 0);
	trans[4][12]	= settr(422,0,14,8,0,"((!(!((state[2]==3)))&&!((state[2]!=3))))", 1, 2, 0);
	trans[4][13]	= settr(423,0,14,1,0,"goto accept_S4", 0, 2, 0);
	trans[4][16]	= settr(426,0,19,1,0,"break", 0, 2, 0);
	trans[4][20]	= settr(430,0,19,1,0,".(goto)", 0, 2, 0);
	T = trans[4][19] = settr(429,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(429,0,17,0,0,"DO", 0, 2, 0);
	trans[4][17]	= settr(427,0,19,9,0,"((!(!((state[1]==3)))&&!((state[1]!=3))))", 1, 2, 0);
	trans[4][18]	= settr(428,0,19,1,0,"goto accept_S25", 0, 2, 0);
	trans[4][21]	= settr(431,0,24,1,0,"break", 0, 2, 0);
	trans[4][25]	= settr(435,0,24,1,0,".(goto)", 0, 2, 0);
	T = trans[4][24] = settr(434,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(434,0,22,0,0,"DO", 0, 2, 0);
	trans[4][22]	= settr(432,0,24,10,0,"((!(!((state[0]==3)))&&!((state[0]!=3))))", 1, 2, 0);
	trans[4][23]	= settr(433,0,24,1,0,"goto accept_S46", 0, 2, 0);
	trans[4][26]	= settr(436,0,27,1,0,"break", 0, 2, 0);
	trans[4][27]	= settr(437,0,0,11,11,"-end-", 0, 3500, 0);

	/* proctype 3: fairness */

	trans[3] = (Trans **) emalloc(14*sizeof(Trans *));

	trans[3][6]	= settr(403,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[3][5] = settr(402,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(402,0,1,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(402,0,3,0,0,"DO", 0, 2, 0);
	trans[3][1]	= settr(398,0,10,12,0,"(!(((((state[0]!=1)&&(state[1]!=1))||((state[0]!=1)&&(state[2]!=1)))||((state[1]!=1)&&(state[2]!=1)))))", 1, 2, 0);
	trans[3][2]	= settr(399,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[3][3]	= settr(400,0,5,1,0,"(1)", 0, 2, 0);
	trans[3][4]	= settr(401,0,5,1,0,"goto T0_init", 0, 2, 0);
	trans[3][7]	= settr(404,0,10,1,0,"break", 0, 2, 0);
	trans[3][11]	= settr(408,0,10,1,0,".(goto)", 0, 2, 0);
	T = trans[3][10] = settr(407,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(407,0,8,0,0,"DO", 0, 2, 0);
	trans[3][8]	= settr(405,0,10,13,0,"(!(((((state[0]!=1)&&(state[1]!=1))||((state[0]!=1)&&(state[2]!=1)))||((state[1]!=1)&&(state[2]!=1)))))", 1, 2, 0);
	trans[3][9]	= settr(406,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[3][12]	= settr(409,0,13,1,0,"break", 0, 2, 0);
	trans[3][13]	= settr(410,0,0,14,14,"-end-", 0, 3500, 0);

	/* proctype 2: liveness */

	trans[2] = (Trans **) emalloc(7*sizeof(Trans *));

	trans[2][4]	= settr(395,0,3,1,0,".(goto)", 0, 2, 0);
	T = trans[2][3] = settr(394,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(394,0,1,0,0,"DO", 0, 2, 0);
	trans[2][1]	= settr(392,0,3,15,0,"(!((isLeader==1)))", 1, 2, 0);
	trans[2][2]	= settr(393,0,3,1,0,"goto T0_init", 0, 2, 0);
	trans[2][5]	= settr(396,0,6,1,0,"break", 0, 2, 0);
	trans[2][6]	= settr(397,0,0,16,16,"-end-", 0, 3500, 0);

	/* proctype 1: :init: */

	trans[1] = (Trans **) emalloc(17*sizeof(Trans *));

	trans[1][1]	= settr(376,0,14,17,17,"printf('INIT: Starting Raft simulation with %d servers\\n',3)", 0, 2, 0); /* m: 2 -> 0,14 */
	reached1[2] = 1;
	trans[1][2]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	T = trans[ 1][14] = settr(389,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(389,2,3,0,0,"ATOMIC", 1, 2, 0);
	trans[1][3]	= settr(378,2,11,18,18,"i = 0", 1, 2, 0);
	trans[1][12]	= settr(387,2,11,1,0,".(goto)", 1, 2, 0);
	T = trans[1][11] = settr(386,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(386,2,4,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(386,2,9,0,0,"DO", 1, 2, 0);
	trans[1][4]	= settr(379,2,7,19,19,"((i<=(3-1)))", 1, 2, 0); /* m: 5 -> 7,0 */
	reached1[5] = 1;
	trans[1][5]	= settr(0,0,0,0,0,"leader[i] = 0",0,0,0);
	trans[1][6]	= settr(0,0,0,0,0,"connect[i] = 0",0,0,0);
	trans[1][7]	= settr(382,2,8,20,20,"(run server(i))", 1, 2, 0);
	trans[1][8]	= settr(383,2,11,21,21,"i = (i+1)", 1, 2, 0);
	trans[1][9]	= settr(384,2,10,2,0,"else", 1, 2, 0);
	trans[1][10]	= settr(385,2,13,1,0,"goto :b7", 1, 2, 0);
	trans[1][13]	= settr(388,0,15,1,0,"break", 1, 2, 0);
	trans[1][15]	= settr(390,0,16,22,0,"printf('INIT: All servers started\\n')", 0, 2, 0);
	trans[1][16]	= settr(391,0,0,23,23,"-end-", 0, 3500, 0);

	/* proctype 0: server */

	trans[0] = (Trans **) emalloc(377*sizeof(Trans *));

	trans[0][1]	= settr(0,0,2,24,0,"printf('SERVER %d: Starting server process\\n',serverId)", 0, 2, 0);
	trans[0][2]	= settr(1,0,3,25,25,"state[serverId] = 2", 1, 2, 0);
	trans[0][3]	= settr(2,0,4,26,26,"votedFor = 10", 0, 2, 0);
	trans[0][4]	= settr(3,0,5,27,27,"time_out[serverId] = 1", 1, 2, 0);
	trans[0][5]	= settr(4,0,6,28,28,"leader[serverId] = 0", 1, 2, 0);
	trans[0][6]	= settr(5,0,7,29,29,"connect[serverId] = (3-1)", 1, 2, 0);
	trans[0][7]	= settr(6,0,8,30,30,"consecutiveCrashes[serverId] = 0", 1, 2, 0);
	trans[0][8]	= settr(7,0,9,31,0,"printf('SERVER %d: Initialized as follower,term = %d,votedFor = %d,time_out = %d\\n',serverId,currentTerm[serverId],votedFor,time_out[serverId])", 1, 2, 0);
	trans[0][9]	= settr(8,0,372,32,32,"i = 0", 0, 2, 0); /* m: 10 -> 0,372 */
	reached0[10] = 1;
	trans[0][10]	= settr(0,0,0,0,0,"votesGranted[0] = 0",0,0,0);
	trans[0][11]	= settr(0,0,0,0,0,"lastLogTerm = 0",0,0,0);
	trans[0][12]	= settr(0,0,0,0,0,"lastLogIndex = 0",0,0,0);
	trans[0][13]	= settr(0,0,0,0,0,"logOk = 0",0,0,0);
	trans[0][14]	= settr(0,0,0,0,0,"",0,0,0);
	trans[0][15]	= settr(0,0,0,0,0,"",0,0,0);
	trans[0][16]	= settr(0,0,0,0,0,"voteCount = 0",0,0,0);
	trans[0][373]	= settr(372,0,372,1,0,".(goto)", 0, 2, 0);
	T = trans[0][372] = settr(371,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,17,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,41,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,49,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,53,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,100,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,149,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,153,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(371,0,327,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(371,0,361,0,0,"DO", 0, 2, 0);
	trans[0][17]	= settr(16,0,40,33,0,"(((state[serverId]!=1)&&(consecutiveCrashes[serverId]<1)))", 1, 2, 0);
	T = trans[ 0][40] = settr(39,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(39,2,18,0,0,"ATOMIC", 1, 2, 0);
	trans[0][18]	= settr(17,2,26,34,34,"consecutiveCrashes[serverId] = (consecutiveCrashes[serverId]+1)", 1, 2, 0); /* m: 19 -> 0,26 */
	reached0[19] = 1;
	trans[0][19]	= settr(0,0,0,0,0,"printf('SERVER %d: Crashing from state %e (crash count: %d)\\n',serverId,state[serverId],consecutiveCrashes[serverId])",0,0,0);
	T = trans[0][26] = settr(25,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(25,2,20,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(25,2,24,0,0,"IF", 1, 2, 0);
	trans[0][20]	= settr(19,2,36,35,35,"((state[serverId]==4))", 1, 2, 0); /* m: 21 -> 36,0 */
	reached0[21] = 1;
	trans[0][21]	= settr(0,0,0,0,0,"leaders = (leaders-1)",0,0,0);
	trans[0][22]	= settr(0,0,0,0,0,"isLeader = (leaders>0)",0,0,0);
	trans[0][23]	= settr(0,0,0,0,0,"leader[serverId] = 0",0,0,0);
	trans[0][27]	= settr(26,2,28,1,0,".(goto)", 1, 2, 0); /* m: 28 -> 0,36 */
	reached0[28] = 1;
	trans[0][24]	= settr(23,2,25,2,0,"else", 1, 2, 0);
	trans[0][25]	= settr(24,2,36,36,36,"(1)", 1, 2, 0); /* m: 28 -> 36,0 */
	reached0[28] = 1;
	trans[0][28]	= settr(27,2,36,37,37,"state[serverId] = 1", 1, 2, 0); /* m: 29 -> 0,36 */
	reached0[29] = 1;
	trans[0][29]	= settr(0,0,0,0,0,"connect[serverId] = 0",0,0,0);
	trans[0][30]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[0][37]	= settr(36,2,36,1,0,".(goto)", 1, 2, 0);
	T = trans[0][36] = settr(35,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(35,2,31,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(35,2,34,0,0,"DO", 1, 2, 0);
	trans[0][31]	= settr(30,2,36,38,38,"((i<=(3-1)))", 1, 2, 0); /* m: 32 -> 36,0 */
	reached0[32] = 1;
	trans[0][32]	= settr(0,0,0,0,0,"votesGranted[i] = 0",0,0,0);
	trans[0][33]	= settr(0,0,0,0,0,"i = (i+1)",0,0,0);
	trans[0][34]	= settr(33,2,38,2,0,"else", 1, 2, 0);
	trans[0][35]	= settr(34,2,38,1,0,"goto :b1", 1, 2, 0);
	trans[0][38]	= settr(37,2,39,1,0,"break", 1, 2, 0);
	trans[0][39]	= settr(38,0,372,39,39,"votedFor = 10", 1, 2, 0);
	trans[0][41]	= settr(40,0,48,40,0,"((state[serverId]==1))", 1, 2, 0);
	T = trans[ 0][48] = settr(47,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(47,2,42,0,0,"ATOMIC", 1, 2, 0);
	trans[0][42]	= settr(41,0,372,41,41,"printf('SERVER %d: Recovering from crash,becoming follower\\n',serverId)", 1, 2, 0); /* m: 43 -> 0,372 */
	reached0[43] = 1;
	trans[0][43]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][44]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][45]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][46]	= settr(0,0,0,0,0,"connect[serverId] = (3-1)",0,0,0);
	trans[0][47]	= settr(0,0,0,0,0,"consecutiveCrashes[serverId] = 0",0,0,0);
	trans[0][49]	= settr(48,0,52,42,0,"((((state[serverId]!=1)&&(state[serverId]!=4))&&(time_out[serverId]>0)))", 1, 2, 0);
	T = trans[ 0][52] = settr(51,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(51,2,50,0,0,"ATOMIC", 1, 2, 0);
	trans[0][50]	= settr(49,0,372,43,43,"time_out[serverId] = (time_out[serverId]-1)", 1, 2, 0); /* m: 51 -> 0,372 */
	reached0[51] = 1;
	trans[0][51]	= settr(0,0,0,0,0,"printf('SERVER %d: Timer tick,time_out now %d\\n',serverId,time_out[serverId])",0,0,0);
	trans[0][53]	= settr(52,0,99,44,0,"(((state[serverId]==2)&&(time_out[serverId]==0)))", 1, 2, 0);
	T = trans[ 0][99] = settr(98,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(98,2,54,0,0,"ATOMIC", 1, 3, 0);
	trans[0][54]	= settr(53,2,64,45,45,"printf('SERVER %d: Timeout occurred (time_out = 0),becoming candidate\\n',serverId)", 1, 3, 0); /* m: 55 -> 0,64 */
	reached0[55] = 1;
	trans[0][55]	= settr(0,0,0,0,0,"state[serverId] = 3",0,0,0);
	trans[0][56]	= settr(0,0,0,0,0,"currentTerm[serverId] = (currentTerm[serverId]+1)",0,0,0);
	trans[0][57]	= settr(0,0,0,0,0,"votedFor = serverId",0,0,0);
	trans[0][58]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[0][65]	= settr(64,2,64,1,0,".(goto)", 1, 3, 0);
	T = trans[0][64] = settr(63,2,0,0,0,"DO", 1, 3, 0);
	T = T->nxt	= settr(63,2,59,0,0,"DO", 1, 3, 0);
	    T->nxt	= settr(63,2,62,0,0,"DO", 1, 3, 0);
	trans[0][59]	= settr(58,2,64,46,46,"((i<=(3-1)))", 1, 3, 0); /* m: 60 -> 64,0 */
	reached0[60] = 1;
	trans[0][60]	= settr(0,0,0,0,0,"votesGranted[i] = 0",0,0,0);
	trans[0][61]	= settr(0,0,0,0,0,"i = (i+1)",0,0,0);
	trans[0][62]	= settr(61,2,67,2,0,"else", 1, 3, 0);
	trans[0][63]	= settr(62,2,67,1,0,"goto :b2", 1, 3, 0); /* m: 67 -> 0,80 */
	reached0[67] = 1;
	trans[0][66]	= settr(65,2,67,1,0,"break", 1, 3, 0);
	trans[0][67]	= settr(66,2,80,47,47,"votesGranted[serverId] = 1", 1, 3, 0); /* m: 68 -> 0,80 */
	reached0[68] = 1;
	trans[0][68]	= settr(0,0,0,0,0,"outMsg.messageType = 2",0,0,0);
	trans[0][69]	= settr(0,0,0,0,0,"outMsg.sender = serverId",0,0,0);
	trans[0][70]	= settr(0,0,0,0,0,"outMsg.requestVote.term = currentTerm[serverId]",0,0,0);
	T = trans[0][80] = settr(79,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(79,2,71,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(79,2,74,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(79,2,77,0,0,"IF", 1, 3, 0);
	trans[0][71]	= settr(70,2,95,48,48,"((logs[serverId].logs[0]==0))", 1, 3, 0); /* m: 72 -> 95,0 */
	reached0[72] = 1;
	trans[0][72]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogTerm = 0",0,0,0);
	trans[0][73]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogIndex = 0",0,0,0);
	trans[0][81]	= settr(80,2,82,1,0,".(goto)", 1, 3, 0); /* m: 82 -> 0,95 */
	reached0[82] = 1;
	trans[0][74]	= settr(73,2,95,49,49,"(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]==0)))", 1, 3, 0); /* m: 75 -> 95,0 */
	reached0[75] = 1;
	trans[0][75]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogTerm = logs[serverId].logs[0]",0,0,0);
	trans[0][76]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogIndex = 1",0,0,0);
	trans[0][77]	= settr(76,2,95,50,50,"(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]!=0)))", 1, 3, 0); /* m: 78 -> 95,0 */
	reached0[78] = 1;
	trans[0][78]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogTerm = logs[serverId].logs[1]",0,0,0);
	trans[0][79]	= settr(0,0,0,0,0,"outMsg.requestVote.lastLogIndex = 2",0,0,0);
	trans[0][82]	= settr(81,2,95,51,51,"i = 0", 1, 3, 0);
	trans[0][96]	= settr(95,2,95,1,0,".(goto)", 1, 3, 0);
	T = trans[0][95] = settr(94,2,0,0,0,"DO", 1, 3, 0);
	T = T->nxt	= settr(94,2,83,0,0,"DO", 1, 3, 0);
	    T->nxt	= settr(94,2,93,0,0,"DO", 1, 3, 0);
	trans[0][83]	= settr(82,2,90,52,0,"((i<=(3-1)))", 1, 3, 0);
	T = trans[0][90] = settr(89,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(89,2,84,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(89,2,88,0,0,"IF", 1, 3, 0);
	trans[0][84]	= settr(83,2,87,53,53,"((i!=serverId))", 1, 3, 0); /* m: 85 -> 87,0 */
	reached0[85] = 1;
	trans[0][85]	= settr(0,0,0,0,0,"outMsg.receiver = i",0,0,0);
	trans[0][86]	= settr(0,0,0,0,0,"printf('SERVER %d: Sending RequestVote to server %d for term %d\\n',serverId,i,currentTerm[serverId])",0,0,0);
	trans[0][87]	= settr(86,2,95,54,54,"toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted", 1, 3, 0); /* m: 92 -> 95,0 */
	reached0[92] = 1;
	trans[0][91]	= settr(90,2,92,1,0,".(goto)", 1, 3, 0); /* m: 92 -> 0,95 */
	reached0[92] = 1;
	trans[0][88]	= settr(87,2,89,2,0,"else", 1, 3, 0);
	trans[0][89]	= settr(88,2,95,55,55,"(1)", 1, 3, 0); /* m: 92 -> 95,0 */
	reached0[92] = 1;
	trans[0][92]	= settr(91,2,95,56,56,"i = (i+1)", 1, 3, 0);
	trans[0][93]	= settr(92,2,97,2,0,"else", 1, 3, 0);
	trans[0][94]	= settr(93,2,97,1,0,"goto :b3", 1, 3, 0);
	trans[0][97]	= settr(96,2,98,1,0,"break", 1, 3, 0);
	trans[0][98]	= settr(97,0,372,57,0,"printf('SERVER %d: Now candidate for term %d,voted for self\\n',serverId,currentTerm[serverId])", 1, 3, 0);
	trans[0][100]	= settr(99,0,148,58,0,"(((state[serverId]==3)&&(time_out[serverId]==0)))", 1, 2, 0);
	T = trans[ 0][148] = settr(147,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(147,2,101,0,0,"ATOMIC", 1, 3, 0);
	trans[0][101]	= settr(100,2,113,59,59,"voteCount = 0", 1, 3, 0); /* m: 102 -> 0,113 */
	reached0[102] = 1;
	trans[0][102]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[0][114]	= settr(113,2,113,1,0,".(goto)", 1, 3, 0);
	T = trans[0][113] = settr(112,2,0,0,0,"DO", 1, 3, 0);
	T = T->nxt	= settr(112,2,103,0,0,"DO", 1, 3, 0);
	    T->nxt	= settr(112,2,111,0,0,"DO", 1, 3, 0);
	trans[0][103]	= settr(102,2,108,60,0,"((i<=(3-1)))", 1, 3, 0);
	T = trans[0][108] = settr(107,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(107,2,104,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(107,2,106,0,0,"IF", 1, 3, 0);
	trans[0][104]	= settr(103,2,113,61,61,"(votesGranted[i])", 1, 3, 0); /* m: 105 -> 113,0 */
	reached0[105] = 1;
	trans[0][105]	= settr(0,0,0,0,0,"voteCount = (voteCount+1)",0,0,0);
	trans[0][109]	= settr(108,2,110,1,0,".(goto)", 1, 3, 0); /* m: 110 -> 0,113 */
	reached0[110] = 1;
	trans[0][106]	= settr(105,2,107,2,0,"else", 1, 3, 0);
	trans[0][107]	= settr(106,2,113,62,62,"(1)", 1, 3, 0); /* m: 110 -> 113,0 */
	reached0[110] = 1;
	trans[0][110]	= settr(109,2,113,63,63,"i = (i+1)", 1, 3, 0);
	trans[0][111]	= settr(110,2,146,2,0,"else", 1, 3, 0);
	trans[0][112]	= settr(111,2,146,1,0,"goto :b4", 1, 3, 0);
	trans[0][115]	= settr(114,2,146,1,0,"break", 1, 3, 0);
	T = trans[0][146] = settr(145,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(145,2,116,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(145,2,143,0,0,"IF", 1, 3, 0);
	trans[0][116]	= settr(115,2,140,64,64,"((voteCount>(3/2)))", 1, 3, 0); /* m: 117 -> 140,0 */
	reached0[117] = 1;
	trans[0][117]	= settr(0,0,0,0,0,"state[serverId] = 4",0,0,0);
	trans[0][118]	= settr(0,0,0,0,0,"leaders = (leaders+1)",0,0,0);
	trans[0][119]	= settr(0,0,0,0,0,"isLeader = 1",0,0,0);
	trans[0][120]	= settr(0,0,0,0,0,"leader[serverId] = 1",0,0,0);
	trans[0][121]	= settr(0,0,0,0,0,"printf('SERVER %d: Becoming leader for term %d with %d votes\\n',serverId,currentTerm[serverId],voteCount)",0,0,0);
	trans[0][122]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[0][141]	= settr(140,2,140,1,0,".(goto)", 1, 3, 0);
	T = trans[0][140] = settr(139,2,0,0,0,"DO", 1, 3, 0);
	T = T->nxt	= settr(139,2,123,0,0,"DO", 1, 3, 0);
	    T->nxt	= settr(139,2,138,0,0,"DO", 1, 3, 0);
	trans[0][123]	= settr(122,2,135,65,0,"((i<=(3-1)))", 1, 3, 0);
	T = trans[0][135] = settr(134,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(134,2,124,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(134,2,133,0,0,"IF", 1, 3, 0);
	trans[0][124]	= settr(123,2,132,66,66,"((i!=serverId))", 1, 3, 0); /* m: 125 -> 132,0 */
	reached0[125] = 1;
	trans[0][125]	= settr(0,0,0,0,0,"outMsg.messageType = 4",0,0,0);
	trans[0][126]	= settr(0,0,0,0,0,"outMsg.sender = serverId",0,0,0);
	trans[0][127]	= settr(0,0,0,0,0,"outMsg.receiver = i",0,0,0);
	trans[0][128]	= settr(0,0,0,0,0,"outMsg.appendEntry.term = currentTerm[serverId]",0,0,0);
	trans[0][129]	= settr(0,0,0,0,0,"outMsg.appendEntry.leaderCommit = commitIndex[serverId]",0,0,0);
	trans[0][130]	= settr(0,0,0,0,0,"outMsg.appendEntry.index = 10",0,0,0);
	trans[0][131]	= settr(0,0,0,0,0,"printf('SERVER %d: Sending initial heartbeat to server %d\\n',serverId,i)",0,0,0);
	trans[0][132]	= settr(131,2,140,67,67,"toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted", 1, 3, 0); /* m: 137 -> 140,0 */
	reached0[137] = 1;
	trans[0][136]	= settr(135,2,137,1,0,".(goto)", 1, 3, 0); /* m: 137 -> 0,140 */
	reached0[137] = 1;
	trans[0][133]	= settr(132,2,134,2,0,"else", 1, 3, 0);
	trans[0][134]	= settr(133,2,140,68,68,"(1)", 1, 3, 0); /* m: 137 -> 140,0 */
	reached0[137] = 1;
	trans[0][137]	= settr(136,2,140,69,69,"i = (i+1)", 1, 3, 0);
	trans[0][138]	= settr(137,2,142,2,0,"else", 1, 3, 0);
	trans[0][139]	= settr(138,2,142,1,0,"goto :b5", 1, 3, 0);
	trans[0][142]	= settr(141,2,147,1,0,"break", 1, 3, 0);
	trans[0][147]	= settr(146,0,372,70,70,".(goto)", 1, 3, 0);
	trans[0][143]	= settr(142,2,144,2,0,"else", 1, 3, 0);
	trans[0][144]	= settr(143,0,372,71,71,"printf('SERVER %d: Election timeout without majority,restarting election\\n',serverId)", 1, 3, 0); /* m: 145 -> 0,372 */
	reached0[145] = 1;
	trans[0][145]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][149]	= settr(148,0,152,72,0,"((state[serverId]==2))", 1, 2, 0);
	T = trans[ 0][152] = settr(151,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(151,2,150,0,0,"ATOMIC", 1, 2, 0);
	trans[0][150]	= settr(149,0,372,73,73,"printf('SERVER %d: Restarting as follower,resetting timeout\\n',serverId)", 1, 2, 0); /* m: 151 -> 0,372 */
	reached0[151] = 1;
	trans[0][151]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][153]	= settr(152,0,326,74,0,"((toNodes[serverId]?[msg.messageType,msg.sender,msg.receiver,msg.appendEntry.term,msg.appendEntry.leaderCommit,msg.appendEntry.index,msg.appendEntry.prevLogTerm,msg.appendEntryResponse.term,msg.appendEntryResponse.success,msg.requestVote.term,msg.requestVote.lastLogIndex,msg.requestVote.lastLogTerm,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted]&&(state[serverId]!=1)))", 1, 2, 0);
	T = trans[ 0][326] = settr(325,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(325,2,154,0,0,"ATOMIC", 1, 503, 3);
	trans[0][154]	= settr(153,2,324,75,75,"toNodes[serverId]?msg.messageType,msg.sender,msg.receiver,msg.appendEntry.term,msg.appendEntry.leaderCommit,msg.appendEntry.index,msg.appendEntry.prevLogTerm,msg.appendEntryResponse.term,msg.appendEntryResponse.success,msg.requestVote.term,msg.requestVote.lastLogIndex,msg.requestVote.lastLogTerm,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted", 1, 503, 3); /* m: 155 -> 324,0 */
	reached0[155] = 1;
	trans[0][155]	= settr(0,0,0,0,0,"sender = msg.sender",0,0,0);
	T = trans[0][324] = settr(323,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(323,2,156,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(323,2,207,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(323,2,231,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(323,2,289,0,0,"IF", 1, 503, 3);
	trans[0][156]	= settr(155,2,175,76,76,"((msg.messageType==2))", 1, 503, 3); /* m: 157 -> 175,0 */
	reached0[157] = 1;
	trans[0][157]	= settr(0,0,0,0,0,"printf('SERVER %d: Received RequestVote from server %d for term %d\\n',serverId,sender,msg.requestVote.term)",0,0,0);
	T = trans[0][175] = settr(174,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(174,2,158,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(174,2,172,0,0,"IF", 1, 503, 3);
	trans[0][158]	= settr(157,2,166,77,77,"((msg.requestVote.term>currentTerm[serverId]))", 1, 503, 3); /* m: 159 -> 166,0 */
	reached0[159] = 1;
	trans[0][159]	= settr(0,0,0,0,0,"printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.requestVote.term)",0,0,0);
	T = trans[0][166] = settr(165,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(165,2,160,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(165,2,164,0,0,"IF", 1, 503, 3);
	trans[0][160]	= settr(159,2,189,78,78,"((state[serverId]==4))", 1, 503, 3); /* m: 161 -> 189,0 */
	reached0[161] = 1;
	trans[0][161]	= settr(0,0,0,0,0,"leaders = (leaders-1)",0,0,0);
	trans[0][162]	= settr(0,0,0,0,0,"isLeader = (leaders>0)",0,0,0);
	trans[0][163]	= settr(0,0,0,0,0,"leader[serverId] = 0",0,0,0);
	trans[0][167]	= settr(166,2,168,1,0,".(goto)", 1, 503, 3); /* m: 168 -> 0,189 */
	reached0[168] = 1;
	trans[0][164]	= settr(163,2,165,2,0,"else", 1, 503, 3);
	trans[0][165]	= settr(164,2,189,79,79,"(1)", 1, 503, 3); /* m: 168 -> 189,0 */
	reached0[168] = 1;
	trans[0][168]	= settr(167,2,189,80,80,"currentTerm[serverId] = msg.requestVote.term", 1, 503, 3); /* m: 169 -> 0,189 */
	reached0[169] = 1;
	trans[0][169]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][170]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][171]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][176]	= settr(175,2,189,1,0,".(goto)", 1, 503, 3);
	trans[0][172]	= settr(171,2,174,81,81,"((msg.requestVote.term<=currentTerm[serverId]))", 1, 503, 3); /* m: 173 -> 174,0 */
	reached0[173] = 1;
	trans[0][173]	= settr(0,0,0,0,0,"printf('SERVER %d: RequestVote term %d <= current term %d\\n',serverId,msg.requestVote.term,currentTerm[serverId])",0,0,0);
	trans[0][174]	= settr(173,2,189,1,0,"(1)", 1, 503, 3);
	T = trans[0][189] = settr(188,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(188,2,177,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(188,2,181,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(188,2,185,0,0,"IF", 1, 503, 3);
	trans[0][177]	= settr(176,2,204,82,82,"((logs[serverId].logs[0]==0))", 1, 503, 3); /* m: 178 -> 204,0 */
	reached0[178] = 1;
	trans[0][178]	= settr(0,0,0,0,0,"lastLogTerm = 0",0,0,0);
	trans[0][179]	= settr(0,0,0,0,0,"lastLogIndex = 0",0,0,0);
	trans[0][180]	= settr(0,0,0,0,0,"printf('SERVER %d: My last log empty,lastLogTerm = 0,lastLogIndex = 0\\n',serverId)",0,0,0);
	trans[0][190]	= settr(189,2,191,1,0,".(goto)", 1, 503, 3); /* m: 191 -> 0,204 */
	reached0[191] = 1;
	trans[0][181]	= settr(180,2,204,83,83,"(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]==0)))", 1, 503, 3); /* m: 182 -> 204,0 */
	reached0[182] = 1;
	trans[0][182]	= settr(0,0,0,0,0,"lastLogTerm = logs[serverId].logs[0]",0,0,0);
	trans[0][183]	= settr(0,0,0,0,0,"lastLogIndex = 1",0,0,0);
	trans[0][184]	= settr(0,0,0,0,0,"printf('SERVER %d: My last log at index 0,lastLogTerm = %d,lastLogIndex = 1\\n',serverId,lastLogTerm)",0,0,0);
	trans[0][185]	= settr(184,2,204,84,84,"(((logs[serverId].logs[0]!=0)&&(logs[serverId].logs[1]!=0)))", 1, 503, 3); /* m: 186 -> 204,0 */
	reached0[186] = 1;
	trans[0][186]	= settr(0,0,0,0,0,"lastLogTerm = logs[serverId].logs[1]",0,0,0);
	trans[0][187]	= settr(0,0,0,0,0,"lastLogIndex = 2",0,0,0);
	trans[0][188]	= settr(0,0,0,0,0,"printf('SERVER %d: My last log at index 1,lastLogTerm = %d,lastLogIndex = 2\\n',serverId,lastLogTerm)",0,0,0);
	trans[0][191]	= settr(190,2,204,85,85,"logOk = ((msg.requestVote.lastLogTerm>lastLogTerm)||((msg.requestVote.lastLogTerm==lastLogTerm)&&(msg.requestVote.lastLogIndex>=lastLogIndex)))", 1, 503, 3); /* m: 192 -> 0,204 */
	reached0[192] = 1;
	trans[0][192]	= settr(0,0,0,0,0,"voteGranted = (((msg.requestVote.term==currentTerm[serverId])&&logOk)&&((votedFor==10)||(votedFor==sender)))",0,0,0);
	trans[0][193]	= settr(0,0,0,0,0,"outMsg.messageType = 1",0,0,0);
	trans[0][194]	= settr(0,0,0,0,0,"outMsg.sender = serverId",0,0,0);
	trans[0][195]	= settr(0,0,0,0,0,"outMsg.receiver = sender",0,0,0);
	trans[0][196]	= settr(0,0,0,0,0,"outMsg.requestVoteResponse.term = currentTerm[serverId]",0,0,0);
	trans[0][197]	= settr(0,0,0,0,0,"outMsg.requestVoteResponse.voteGranted = voteGranted",0,0,0);
	T = trans[0][204] = settr(203,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(203,2,198,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(203,2,201,0,0,"IF", 1, 503, 3);
	trans[0][198]	= settr(197,2,206,86,86,"(voteGranted)", 1, 503, 3); /* m: 199 -> 206,0 */
	reached0[199] = 1;
	trans[0][199]	= settr(0,0,0,0,0,"votedFor = sender",0,0,0);
	trans[0][200]	= settr(0,0,0,0,0,"printf('SERVER %d: Granting vote to server %d for term %d\\n',serverId,sender,currentTerm[serverId])",0,0,0);
	trans[0][205]	= settr(204,2,206,1,0,".(goto)", 1, 503, 3);
	trans[0][201]	= settr(200,2,203,87,87,"(!(voteGranted))", 1, 503, 3); /* m: 202 -> 203,0 */
	reached0[202] = 1;
	trans[0][202]	= settr(0,0,0,0,0,"printf('SERVER %d: Rejecting vote for server %d,term = %d,logOk = %d,votedFor = %d\\n',serverId,sender,currentTerm[serverId],logOk,votedFor)",0,0,0);
	trans[0][203]	= settr(202,2,206,1,0,"(1)", 1, 503, 3);
	trans[0][206]	= settr(205,0,372,88,88,"toNodes[sender]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted", 1, 503, 3); /* m: 325 -> 372,0 */
	reached0[325] = 1;
	trans[0][325]	= settr(324,0,372,89,89,".(goto)", 1, 503, 3);
	trans[0][207]	= settr(206,2,229,90,90,"((msg.messageType==1))", 1, 503, 3); /* m: 208 -> 229,0 */
	reached0[208] = 1;
	trans[0][208]	= settr(0,0,0,0,0,"printf('SERVER %d: Received RequestVoteResponse from server %d,term = %d,granted = %d\\n',serverId,sender,msg.requestVoteResponse.term,msg.requestVoteResponse.voteGranted)",0,0,0);
	T = trans[0][229] = settr(228,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(228,2,209,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(228,2,223,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(228,2,226,0,0,"IF", 1, 503, 3);
	trans[0][209]	= settr(208,2,217,91,91,"((msg.requestVoteResponse.term>currentTerm[serverId]))", 1, 503, 3); /* m: 210 -> 217,0 */
	reached0[210] = 1;
	trans[0][210]	= settr(0,0,0,0,0,"printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.requestVoteResponse.term)",0,0,0);
	T = trans[0][217] = settr(216,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(216,2,211,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(216,2,215,0,0,"IF", 1, 503, 3);
	trans[0][211]	= settr(210,0,372,92,92,"((state[serverId]==4))", 1, 503, 3); /* m: 212 -> 372,0 */
	reached0[212] = 1;
	trans[0][212]	= settr(0,0,0,0,0,"leaders = (leaders-1)",0,0,0);
	trans[0][213]	= settr(0,0,0,0,0,"isLeader = (leaders>0)",0,0,0);
	trans[0][214]	= settr(0,0,0,0,0,"leader[serverId] = 0",0,0,0);
	trans[0][218]	= settr(217,2,219,1,0,".(goto)", 1, 503, 3); /* m: 219 -> 0,372 */
	reached0[219] = 1;
	trans[0][215]	= settr(214,2,216,2,0,"else", 1, 503, 3);
	trans[0][216]	= settr(215,0,372,93,93,"(1)", 1, 503, 3); /* m: 219 -> 372,0 */
	reached0[219] = 1;
	trans[0][219]	= settr(218,0,372,94,94,"currentTerm[serverId] = msg.requestVoteResponse.term", 1, 503, 3); /* m: 220 -> 0,372 */
	reached0[220] = 1;
	trans[0][220]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][221]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][222]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][230]	= settr(229,0,372,95,95,".(goto)", 1, 503, 3); /* m: 325 -> 0,372 */
	reached0[325] = 1;
	trans[0][223]	= settr(222,0,372,96,96,"((((msg.requestVoteResponse.term==currentTerm[serverId])&&msg.requestVoteResponse.voteGranted)&&(state[serverId]==3)))", 1, 503, 3); /* m: 224 -> 372,0 */
	reached0[224] = 1;
	trans[0][224]	= settr(0,0,0,0,0,"votesGranted[sender] = 1",0,0,0);
	trans[0][225]	= settr(0,0,0,0,0,"printf('SERVER %d: Vote granted by server %d\\n',serverId,sender)",0,0,0);
	trans[0][226]	= settr(225,2,227,2,0,"else", 1, 503, 3);
	trans[0][227]	= settr(226,2,228,97,0,"printf('SERVER %d: Vote not granted by server %d or no longer a candidate\\n',serverId,sender)", 1, 503, 3);
	trans[0][228]	= settr(227,0,372,98,98,"(1)", 1, 503, 3); /* m: 230 -> 372,0 */
	reached0[230] = 1;
	trans[0][231]	= settr(230,2,250,99,99,"((msg.messageType==4))", 1, 503, 3); /* m: 232 -> 250,0 */
	reached0[232] = 1;
	trans[0][232]	= settr(0,0,0,0,0,"printf('SERVER %d: Received AppendEntries from server %d,term = %d,index = %d\\n',serverId,sender,msg.appendEntry.term,msg.appendEntry.index)",0,0,0);
	T = trans[0][250] = settr(249,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(249,2,233,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(249,2,247,0,0,"IF", 1, 503, 3);
	trans[0][233]	= settr(232,2,241,100,100,"((msg.appendEntry.term>currentTerm[serverId]))", 1, 503, 3); /* m: 234 -> 241,0 */
	reached0[234] = 1;
	trans[0][234]	= settr(0,0,0,0,0,"printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.appendEntry.term)",0,0,0);
	T = trans[0][241] = settr(240,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(240,2,235,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(240,2,239,0,0,"IF", 1, 503, 3);
	trans[0][235]	= settr(234,2,265,101,101,"((state[serverId]==4))", 1, 503, 3); /* m: 236 -> 265,0 */
	reached0[236] = 1;
	trans[0][236]	= settr(0,0,0,0,0,"leaders = (leaders-1)",0,0,0);
	trans[0][237]	= settr(0,0,0,0,0,"isLeader = (leaders>0)",0,0,0);
	trans[0][238]	= settr(0,0,0,0,0,"leader[serverId] = 0",0,0,0);
	trans[0][242]	= settr(241,2,243,1,0,".(goto)", 1, 503, 3); /* m: 243 -> 0,265 */
	reached0[243] = 1;
	trans[0][239]	= settr(238,2,240,2,0,"else", 1, 503, 3);
	trans[0][240]	= settr(239,2,265,102,102,"(1)", 1, 503, 3); /* m: 243 -> 265,0 */
	reached0[243] = 1;
	trans[0][243]	= settr(242,2,265,103,103,"currentTerm[serverId] = msg.appendEntry.term", 1, 503, 3); /* m: 244 -> 0,265 */
	reached0[244] = 1;
	trans[0][244]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][245]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][246]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][251]	= settr(250,2,265,1,0,".(goto)", 1, 503, 3);
	trans[0][247]	= settr(246,2,249,104,104,"((msg.appendEntry.term<=currentTerm[serverId]))", 1, 503, 3); /* m: 248 -> 249,0 */
	reached0[248] = 1;
	trans[0][248]	= settr(0,0,0,0,0,"printf('SERVER %d: AppendEntries term %d <= current term %d\\n',serverId,msg.appendEntry.term,currentTerm[serverId])",0,0,0);
	trans[0][249]	= settr(248,2,265,1,0,"(1)", 1, 503, 3);
	T = trans[0][265] = settr(264,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(264,2,252,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(264,2,263,0,0,"IF", 1, 503, 3);
	trans[0][252]	= settr(251,2,259,105,0,"((msg.appendEntry.term==currentTerm[serverId]))", 1, 503, 3);
	T = trans[0][259] = settr(258,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(258,2,253,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(258,2,257,0,0,"IF", 1, 503, 3);
	trans[0][253]	= settr(252,2,286,106,106,"((state[serverId]==3))", 1, 503, 3); /* m: 254 -> 286,0 */
	reached0[254] = 1;
	trans[0][254]	= settr(0,0,0,0,0,"printf('SERVER %d: Stepping down from candidate to follower for term %d\\n',serverId,currentTerm[serverId])",0,0,0);
	trans[0][255]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][256]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][260]	= settr(259,2,261,1,0,".(goto)", 1, 503, 3); /* m: 261 -> 0,286 */
	reached0[261] = 1;
	trans[0][257]	= settr(256,2,258,2,0,"else", 1, 503, 3);
	trans[0][258]	= settr(257,2,286,107,107,"(1)", 1, 503, 3); /* m: 261 -> 286,0 */
	reached0[261] = 1;
	trans[0][261]	= settr(260,2,286,108,108,"time_out[serverId] = 1", 1, 503, 3); /* m: 262 -> 0,286 */
	reached0[262] = 1;
	trans[0][262]	= settr(0,0,0,0,0,"printf('SERVER %d: Reset timeout on AppendEntries from leader\\n',serverId)",0,0,0);
	trans[0][266]	= settr(265,2,267,1,0,".(goto)", 1, 503, 3); /* m: 267 -> 0,286 */
	reached0[267] = 1;
	trans[0][263]	= settr(262,2,264,2,0,"else", 1, 503, 3);
	trans[0][264]	= settr(263,2,286,109,109,"(1)", 1, 503, 3); /* m: 267 -> 286,0 */
	reached0[267] = 1;
	trans[0][267]	= settr(266,2,286,110,110,"logOk = ((msg.appendEntry.index==0)||((msg.appendEntry.index==1)&&(msg.appendEntry.prevLogTerm==logs[serverId].logs[0])))", 1, 503, 3); /* m: 268 -> 0,286 */
	reached0[268] = 1;
	trans[0][268]	= settr(0,0,0,0,0,"outMsg.messageType = 3",0,0,0);
	trans[0][269]	= settr(0,0,0,0,0,"outMsg.sender = serverId",0,0,0);
	trans[0][270]	= settr(0,0,0,0,0,"outMsg.receiver = sender",0,0,0);
	trans[0][271]	= settr(0,0,0,0,0,"outMsg.appendEntryResponse.term = currentTerm[serverId]",0,0,0);
	T = trans[0][286] = settr(285,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(285,2,272,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(285,2,275,0,0,"IF", 1, 503, 3);
	trans[0][272]	= settr(271,2,288,111,111,"(((msg.appendEntry.term<currentTerm[serverId])||(((msg.appendEntry.term==currentTerm[serverId])&&(state[serverId]==2))&&!(logOk))))", 1, 503, 3); /* m: 273 -> 288,0 */
	reached0[273] = 1;
	trans[0][273]	= settr(0,0,0,0,0,"outMsg.appendEntryResponse.success = 0",0,0,0);
	trans[0][274]	= settr(0,0,0,0,0,"printf('SERVER %d: Rejecting AppendEntries,term = %d,logOk = %d\\n',serverId,currentTerm[serverId],logOk)",0,0,0);
	trans[0][287]	= settr(286,2,288,1,0,".(goto)", 1, 503, 3);
	trans[0][275]	= settr(274,2,282,112,112,"((((msg.appendEntry.term==currentTerm[serverId])&&(state[serverId]==2))&&logOk))", 1, 503, 3); /* m: 276 -> 282,0 */
	reached0[276] = 1;
	trans[0][276]	= settr(0,0,0,0,0,"outMsg.appendEntryResponse.success = 1",0,0,0);
	trans[0][277]	= settr(0,0,0,0,0,"printf('SERVER %d: Accepting AppendEntries,updating log at index %d to term %d\\n',serverId,msg.appendEntry.index,msg.appendEntry.term)",0,0,0);
	T = trans[0][282] = settr(281,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(281,2,278,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(281,2,280,0,0,"IF", 1, 503, 3);
	trans[0][278]	= settr(277,2,288,113,113,"((msg.appendEntry.index!=10))", 1, 503, 3); /* m: 279 -> 288,0 */
	reached0[279] = 1;
	trans[0][279]	= settr(0,0,0,0,0,"logs[serverId].logs[msg.appendEntry.index] = msg.appendEntry.term",0,0,0);
	trans[0][283]	= settr(282,2,284,1,0,".(goto)", 1, 503, 3); /* m: 284 -> 0,288 */
	reached0[284] = 1;
	trans[0][280]	= settr(279,2,281,2,0,"else", 1, 503, 3);
	trans[0][281]	= settr(280,2,288,114,114,"(1)", 1, 503, 3); /* m: 284 -> 288,0 */
	reached0[284] = 1;
	trans[0][284]	= settr(283,2,288,115,115,"commitIndex[serverId] = msg.appendEntry.leaderCommit", 1, 503, 3); /* m: 285 -> 0,288 */
	reached0[285] = 1;
	trans[0][285]	= settr(0,0,0,0,0,"printf('SERVER %d: Updated commitIndex to %d\\n',serverId,commitIndex[serverId])",0,0,0);
	trans[0][288]	= settr(287,0,372,116,116,"toNodes[sender]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted", 1, 503, 3); /* m: 325 -> 372,0 */
	reached0[325] = 1;
	trans[0][289]	= settr(288,2,322,117,117,"((msg.messageType==3))", 1, 503, 3); /* m: 290 -> 322,0 */
	reached0[290] = 1;
	trans[0][290]	= settr(0,0,0,0,0,"printf('SERVER %d: Received AppendEntriesResponse from server %d,term = %d,success = %d\\n',serverId,sender,msg.appendEntryResponse.term,msg.appendEntryResponse.success)",0,0,0);
	T = trans[0][322] = settr(321,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(321,2,291,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(321,2,305,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(321,2,308,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(321,2,319,0,0,"IF", 1, 503, 3);
	trans[0][291]	= settr(290,2,299,118,118,"((msg.appendEntryResponse.term>currentTerm[serverId]))", 1, 503, 3); /* m: 292 -> 299,0 */
	reached0[292] = 1;
	trans[0][292]	= settr(0,0,0,0,0,"printf('SERVER %d: Updating term from %d to %d and becoming follower\\n',serverId,currentTerm[serverId],msg.appendEntryResponse.term)",0,0,0);
	T = trans[0][299] = settr(298,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(298,2,293,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(298,2,297,0,0,"IF", 1, 503, 3);
	trans[0][293]	= settr(292,0,372,119,119,"((state[serverId]==4))", 1, 503, 3); /* m: 294 -> 372,0 */
	reached0[294] = 1;
	trans[0][294]	= settr(0,0,0,0,0,"leaders = (leaders-1)",0,0,0);
	trans[0][295]	= settr(0,0,0,0,0,"isLeader = (leaders>0)",0,0,0);
	trans[0][296]	= settr(0,0,0,0,0,"leader[serverId] = 0",0,0,0);
	trans[0][300]	= settr(299,2,301,1,0,".(goto)", 1, 503, 3); /* m: 301 -> 0,372 */
	reached0[301] = 1;
	trans[0][297]	= settr(296,2,298,2,0,"else", 1, 503, 3);
	trans[0][298]	= settr(297,0,372,120,120,"(1)", 1, 503, 3); /* m: 301 -> 372,0 */
	reached0[301] = 1;
	trans[0][301]	= settr(300,0,372,121,121,"currentTerm[serverId] = msg.appendEntryResponse.term", 1, 503, 3); /* m: 302 -> 0,372 */
	reached0[302] = 1;
	trans[0][302]	= settr(0,0,0,0,0,"state[serverId] = 2",0,0,0);
	trans[0][303]	= settr(0,0,0,0,0,"votedFor = 10",0,0,0);
	trans[0][304]	= settr(0,0,0,0,0,"time_out[serverId] = 1",0,0,0);
	trans[0][323]	= settr(322,0,372,122,122,".(goto)", 1, 503, 3); /* m: 325 -> 0,372 */
	reached0[325] = 1;
	trans[0][305]	= settr(304,2,307,123,123,"((msg.appendEntryResponse.term<currentTerm[serverId]))", 1, 503, 3); /* m: 306 -> 307,0 */
	reached0[306] = 1;
	trans[0][306]	= settr(0,0,0,0,0,"printf('SERVER %d: Ignoring AppendEntriesResponse with lower term %d\\n',serverId,msg.appendEntryResponse.term)",0,0,0);
	trans[0][307]	= settr(306,0,372,124,124,"(1)", 1, 503, 3); /* m: 323 -> 372,0 */
	reached0[323] = 1;
	trans[0][308]	= settr(307,2,317,125,125,"((((msg.appendEntryResponse.term==currentTerm[serverId])&&msg.appendEntryResponse.success)&&(state[serverId]==4)))", 1, 503, 3); /* m: 309 -> 317,0 */
	reached0[309] = 1;
	trans[0][309]	= settr(0,0,0,0,0,"printf('SERVER %d: Successful AppendEntries,considering commit advancement\\n',serverId)",0,0,0);
	trans[0][310]	= settr(0,0,0,0,0,"connect[serverId] = (connect[serverId]+1)",0,0,0);
	T = trans[0][317] = settr(316,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(316,2,311,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(316,2,314,0,0,"IF", 1, 503, 3);
	trans[0][311]	= settr(310,0,372,126,126,"(((commitIndex[serverId]==0)&&(logs[sender].logs[0]==logs[serverId].logs[0])))", 1, 503, 3); /* m: 312 -> 372,0 */
	reached0[312] = 1;
	trans[0][312]	= settr(0,0,0,0,0,"commitIndex[serverId] = 1",0,0,0);
	trans[0][313]	= settr(0,0,0,0,0,"printf('SERVER %d: Advanced commitIndex to 1\\n',serverId)",0,0,0);
	trans[0][318]	= settr(317,2,323,1,0,".(goto)", 1, 503, 3); /* m: 323 -> 0,372 */
	reached0[323] = 1;
	trans[0][314]	= settr(313,2,315,2,0,"else", 1, 503, 3);
	trans[0][315]	= settr(314,2,316,127,0,"printf('SERVER %d: Cannot advance commitIndex further\\n',serverId)", 1, 503, 3);
	trans[0][316]	= settr(315,0,372,128,128,"(1)", 1, 503, 3); /* m: 323 -> 372,0 */
	reached0[323] = 1;
	trans[0][319]	= settr(318,2,320,2,0,"else", 1, 503, 3);
	trans[0][320]	= settr(319,2,321,129,0,"printf('SERVER %d: AppendEntriesResponse not successful or not leader\\n',serverId)", 1, 503, 3);
	trans[0][321]	= settr(320,0,372,130,130,"(1)", 1, 503, 3); /* m: 323 -> 372,0 */
	reached0[323] = 1;
	trans[0][327]	= settr(326,0,360,131,0,"((state[serverId]==4))", 1, 2, 0);
	T = trans[ 0][360] = settr(359,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(359,2,328,0,0,"ATOMIC", 1, 3, 0);
	trans[0][328]	= settr(327,2,357,132,132,"i = 0", 1, 3, 0);
	trans[0][358]	= settr(357,2,357,1,0,".(goto)", 1, 3, 0);
	T = trans[0][357] = settr(356,2,0,0,0,"DO", 1, 3, 0);
	T = T->nxt	= settr(356,2,329,0,0,"DO", 1, 3, 0);
	    T->nxt	= settr(356,2,355,0,0,"DO", 1, 3, 0);
	trans[0][329]	= settr(328,2,352,133,0,"((i<=(3-1)))", 1, 3, 0);
	T = trans[0][352] = settr(351,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(351,2,330,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(351,2,350,0,0,"IF", 1, 3, 0);
	trans[0][330]	= settr(329,2,347,134,134,"((i!=serverId))", 1, 3, 0); /* m: 331 -> 347,0 */
	reached0[331] = 1;
	trans[0][331]	= settr(0,0,0,0,0,"outMsg.messageType = 4",0,0,0);
	trans[0][332]	= settr(0,0,0,0,0,"outMsg.sender = serverId",0,0,0);
	trans[0][333]	= settr(0,0,0,0,0,"outMsg.receiver = i",0,0,0);
	trans[0][334]	= settr(0,0,0,0,0,"outMsg.appendEntry.term = currentTerm[serverId]",0,0,0);
	trans[0][335]	= settr(0,0,0,0,0,"outMsg.appendEntry.leaderCommit = commitIndex[serverId]",0,0,0);
	trans[0][336]	= settr(0,0,0,0,0,"printf('SERVER %d: Leader sending AppendEntries to server %d\\n',serverId,i)",0,0,0);
	T = trans[0][347] = settr(346,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(346,2,337,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(346,2,340,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(346,2,344,0,0,"IF", 1, 3, 0);
	trans[0][337]	= settr(336,2,349,135,135,"((logs[serverId].logs[0]!=logs[i].logs[0]))", 1, 3, 0); /* m: 338 -> 349,0 */
	reached0[338] = 1;
	trans[0][338]	= settr(0,0,0,0,0,"outMsg.appendEntry.index = 0",0,0,0);
	trans[0][339]	= settr(0,0,0,0,0,"printf('SERVER %d: Sending log at index 0,term = %d\\n',serverId,outMsg.appendEntry.term)",0,0,0);
	trans[0][348]	= settr(347,2,349,1,0,".(goto)", 1, 3, 0);
	trans[0][340]	= settr(339,2,349,136,136,"((((logs[serverId].logs[1]!=0)&&(logs[serverId].logs[0]==logs[i].logs[0]))&&(logs[serverId].logs[1]!=logs[i].logs[1])))", 1, 3, 0); /* m: 341 -> 349,0 */
	reached0[341] = 1;
	trans[0][341]	= settr(0,0,0,0,0,"outMsg.appendEntry.index = 1",0,0,0);
	trans[0][342]	= settr(0,0,0,0,0,"outMsg.appendEntry.prevLogTerm = logs[i].logs[0]",0,0,0);
	trans[0][343]	= settr(0,0,0,0,0,"printf('SERVER %d: Sending log at index 1,term = %d,prevLogTerm = %d\\n',serverId,outMsg.appendEntry.term,outMsg.appendEntry.prevLogTerm)",0,0,0);
	trans[0][344]	= settr(343,2,345,2,0,"else", 1, 3, 0);
	trans[0][345]	= settr(344,2,349,137,137,"outMsg.appendEntry.index = 10", 1, 3, 0); /* m: 346 -> 0,349 */
	reached0[346] = 1;
	trans[0][346]	= settr(0,0,0,0,0,"printf('SERVER %d: No new logs to send to server %d,sending heartbeat\\n',serverId,i)",0,0,0);
	trans[0][349]	= settr(348,2,357,138,138,"toNodes[i]!outMsg.messageType,outMsg.sender,outMsg.receiver,outMsg.appendEntry.term,outMsg.appendEntry.leaderCommit,outMsg.appendEntry.index,outMsg.appendEntry.prevLogTerm,outMsg.appendEntryResponse.term,outMsg.appendEntryResponse.success,outMsg.requestVote.term,outMsg.requestVote.lastLogIndex,outMsg.requestVote.lastLogTerm,outMsg.requestVoteResponse.term,outMsg.requestVoteResponse.voteGranted", 1, 3, 0); /* m: 354 -> 357,0 */
	reached0[354] = 1;
	trans[0][353]	= settr(352,2,354,1,0,".(goto)", 1, 3, 0); /* m: 354 -> 0,357 */
	reached0[354] = 1;
	trans[0][350]	= settr(349,2,351,2,0,"else", 1, 3, 0);
	trans[0][351]	= settr(350,2,357,139,139,"(1)", 1, 3, 0); /* m: 354 -> 357,0 */
	reached0[354] = 1;
	trans[0][354]	= settr(353,2,357,140,140,"i = (i+1)", 1, 3, 0);
	trans[0][355]	= settr(354,2,356,2,0,"else", 1, 3, 0);
	trans[0][356]	= settr(355,2,359,1,0,"goto :b6", 1, 3, 0);
	trans[0][359]	= settr(358,0,372,1,0,"break", 1, 3, 0);
	trans[0][361]	= settr(360,0,371,141,0,"(((state[serverId]==4)&&(logs[serverId].logs[1]==0)))", 1, 2, 0);
	T = trans[ 0][371] = settr(370,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(370,2,368,0,0,"ATOMIC", 1, 2, 0);
	T = trans[0][368] = settr(367,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(367,2,362,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(367,2,365,0,0,"IF", 1, 2, 0);
	trans[0][362]	= settr(361,2,370,142,142,"((logs[serverId].logs[0]==0))", 1, 2, 0); /* m: 363 -> 370,0 */
	reached0[363] = 1;
	trans[0][363]	= settr(0,0,0,0,0,"logs[serverId].logs[0] = currentTerm[serverId]",0,0,0);
	trans[0][364]	= settr(0,0,0,0,0,"printf('SERVER %d: Client request,adding entry at index 0 with term %d\\n',serverId,currentTerm[serverId])",0,0,0);
	trans[0][369]	= settr(368,2,370,143,143,".(goto)", 1, 2, 0);
	trans[0][365]	= settr(364,2,370,144,144,"((logs[serverId].logs[0]!=0))", 1, 2, 0); /* m: 366 -> 370,0 */
	reached0[366] = 1;
	trans[0][366]	= settr(0,0,0,0,0,"logs[serverId].logs[1] = currentTerm[serverId]",0,0,0);
	trans[0][367]	= settr(0,0,0,0,0,"printf('SERVER %d: Client request,adding entry at index 1 with term %d\\n',serverId,currentTerm[serverId])",0,0,0);
	trans[0][370]	= settr(369,0,372,1,0,"(1)", 1, 2, 0);
	trans[0][374]	= settr(373,0,375,1,0,"break", 0, 2, 0);
	trans[0][375]	= settr(374,0,376,145,0,"printf('SERVER %d: Process terminated\\n',serverId)", 0, 2, 0);
	trans[0][376]	= settr(375,0,0,146,146,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(3*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
