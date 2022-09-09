Return-Path: <ksummit+bounces-769-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CEE5B305E
	for <lists@lfdr.de>; Fri,  9 Sep 2022 09:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD64F1C208FC
	for <lists@lfdr.de>; Fri,  9 Sep 2022 07:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DE67E1;
	Fri,  9 Sep 2022 07:42:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577265A
	for <ksummit@lists.linux.dev>; Fri,  9 Sep 2022 07:41:58 +0000 (UTC)
Received: from localhost (unknown [151.43.89.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E8BE6732;
	Fri,  9 Sep 2022 07:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8BE6732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1662708790; bh=aDY1iGDTSL0Bwzy+IaraNzWVFuHndNDNgskiWpwgRnw=;
	h=From:To:Cc:Subject:Date:From;
	b=pdpBoolsO471g2ywCVPglMpXVYaG1TYd1AzlHCCqwZjH/tKr46wi0A9JCjU9tuyZ2
	 GzCaoMKYq0GgNGIB7YNvlHOU761DzqYFitN5lzSIO5d1P+SKwlzvP9U5kHOBtsumzw
	 3hglXT12VLRtsHZmxcHEuydiNy7Pk0WjE9x0ZVy/vPpB22qA6RftrK26MHjyzPffXk
	 Qo6JRkx48guxmUUgU2J9wiv4wkqIa2qHvDwsjD9bLPLS+4cUZOD/6065sYm35sP0LF
	 6+q6h0SLz7wRUyebH/l/WPrR59d6lJtAe2MkNCXMv6zrM+a/HXjvDWKqB78VC5I4HA
	 /SzYG0O6/30ng==
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tab-elections@lists.linuxfoundation.org
Subject: REMINDER: LF Technical Advisory Board election
Date: Fri, 09 Sep 2022 01:33:05 -0600
Message-ID: <874jxh6lzi.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

As a reminder, the 2022 Linux Foundation Technical Advisory Board
election will be happening from September 12 to 14.  The call for
nominations is out with a deadline of September 12 - just three days.
Now is the time to put in your nomination if you would like to run for a
seat on the TAB.

Original announcement appended - procrastinate no longer!

Thanks,

jon

The 2022 election for membership on the Linux Foundation Technical Advisory
Board (TAB) will be held electronically during the 2022 Kernel Summit and
Linux Plumbers Conference, from September 12 to 14.  This announcement
covers both the call for candidates and the details of voting in this
election.

The TAB exists to provide advice from the kernel community to the Linux
Foundation; it also serves to facilitate interactions both within the
community and with outside entities.  Over the last year, the TAB has
continued its assistance with the UMN "false commits" episode (including
drafting a set of guidelines for researchers working with the community),
overseen the organization of the Linux Plumbers Conference, put together
guidelines for corporate support of kernel developers and maintainers,
advised on code-of-conduct issues, and more.

CALL FOR NOMINATIONS

The TAB has ten members serving two-year terms; half of the board is
elected each year.  The members whose terms are expiring this year are:

 - Laura Abbott
 - Christian Brauner
 - Kees Cook
 - Chris Mason
 - Dan Williams

The members whose terms expire next year are:

 - Jonathan Corbet
 - Greg Kroah-Hartman
 - Sasha Levin
 - Steve Rostedt
 - Ted Ts'o

Anybody who meets the voting criteria (described below) may self-nominate
to run in this election.  To nominate yourself, please send an email to:

  tech-board-discuss@lists.linux-foundation.org

Please include a short (<= 200 words) statement describing why you are
running and what you would like to accomplish on the TAB; these statements
will be collected and made publicly available.

The nomination deadline is 9:00AM IST (GMT+1) on September 12.

VOTING IN THE TAB ELECTION

The criteria for voting in this year's TAB election are unchanged from
2021.  To be eligible to vote, you must have at least three commits in a
released mainline or stable kernel that:

 - Have a commit date in 2021 or later
 - List your email in a Signed-off-by, Tested-by, Reported-by, Reviewed-by,
   or Acked-by tag.

Everybody with at least 50 commits meeting this description will receive a
ballot automatically.  Eligible voters with less than 50 commits can
receive a ballot by sending a request to
tab-elections@lists.linuxfoundation.org.

We will, once again, be using the Condorcet Internet Voting Service (CIVS)
https://civs1.civs.us/ . This is a voting service focused on security and
privacy. There are sample polls on the website if you would like to see
what a ballot will look like.

Please contact tab-elections@lists.linuxfoundation.org if you have any
questions.


