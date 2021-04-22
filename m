Return-Path: <ksummit+bounces-57-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D5368020
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7DC433E5390
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9212FA1;
	Thu, 22 Apr 2021 12:16:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1302F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:16:51 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13MC4Xha123390;
	Thu, 22 Apr 2021 08:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=nOAUow8p4Er64RSJuTNd1TMYfqxJu+0M9dLZRrUu5DA=;
 b=n5GbU6KMBqbbP+mLzcPE8fTHXUwLVGa1g1z98CAL9cNyycgUV8IXnTIkYlJjKsiVmUZe
 Re4GuTg8kQJRCw1qMBwIie6I12BvlYz4AJDjjLkE9SjoQSbopgYEp+N+iVaa56i5WQ7O
 SoSw7Ka45YFRTCFNhXyUQCJAKXCcfjZOgtpFQpEyAfEtrGArUHS1dGHl9qNe10A3aGE5
 37IJFxEnJJhDOgpngW+UoIUKPo1GjupX5usNTwsG4EeRkyQkas+2NlleIr8cts7mKXDv
 wgeIhuwX0IwNH8bHRjI6d9YgmjFpFhk5A9ConPoGOYCa1HlGgMB7WtXGLFfYLmB+FLy/ iw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3838r1rgy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 08:16:47 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MCF6NV027347;
	Thu, 22 Apr 2021 12:16:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 37yqa89jne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 12:16:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13MCGgRh25493786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 12:16:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AED05A405F;
	Thu, 22 Apr 2021 12:16:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04794A4060;
	Thu, 22 Apr 2021 12:16:42 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Apr 2021 12:16:41 +0000 (GMT)
Date: Thu, 22 Apr 2021 15:16:39 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIFpJ55cCPxd/las@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421194702.GH1981@kadam>
 <20210422113404.09f35a85@coco.lan>
 <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
 <20210422125233.4eed09be@coco.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422125233.4eed09be@coco.lan>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A6baF2VWmP1_-y5hOJwu4tzyoMIyEG4y
X-Proofpoint-ORIG-GUID: A6baF2VWmP1_-y5hOJwu4tzyoMIyEG4y
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_04:2021-04-21,2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220102

On Thu, Apr 22, 2021 at 12:52:33PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 22 Apr 2021 11:59:38 +0200
> Johannes Berg <johannes@sipsolutions.net> escreveu:
> 
> > On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:
> > > 
> > > Here, I use "wdiff" in order to deal with renames. It has a somewhat
> > > funny dialect, but it helps a lot reviewing renaming patches.  
> > 
> > This also helps for casual "git show" etc.:
> > 
> > [core]
> > 	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX
> > 
> > (path may vary, of course)
> 
> Nice!
> 
> Yet, at least on Fedora 33, I had to add a small perl script for it to
> work (modified from https://github.com/git/git/blob/master/contrib/diff-highlight/diff-highlight.perl),
> as git-core-doc-2.28.0-1.fc33.noarch only contains DiffHighlight.pm.

With git 2.29 it works fine on my F33.
 
> Thanks,
> Mauro
> 
> #!/usr/bin/perl
> BEGIN {push @INC, '/usr/share/doc/git/contrib/diff-highlight/'}
> use DiffHighlight;
> 
> # Some scripts may not realize that SIGPIPE is being ignored when launching the
> # pager--for instance scripts written in Python.
> $SIG{PIPE} = 'DEFAULT';
> 
> DiffHighlight::highlight_stdin();
> exit 0;
> 

-- 
Sincerely yours,
Mike.

