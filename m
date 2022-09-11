Return-Path: <ksummit+bounces-771-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BAA5B4E69
	for <lists@lfdr.de>; Sun, 11 Sep 2022 13:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91EF0280C82
	for <lists@lfdr.de>; Sun, 11 Sep 2022 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE711385;
	Sun, 11 Sep 2022 11:28:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E17F
	for <ksummit@lists.linux.dev>; Sun, 11 Sep 2022 11:28:17 +0000 (UTC)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3E0B277D;
	Sun, 11 Sep 2022 11:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E0B277D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1662895689; bh=1Xt19zUgWmFn3RWnnApd5AzFPqYkeUT2s5zWjw8w0Ms=;
	h=From:To:Cc:Subject:Date:From;
	b=aXxUk77MC8BAE1mrOjITZ+t6IqFKtPWa28TSTqEN1mr2FJg2sp5kI57S1dNg2F3mU
	 vxnixTuAosoaBNOEUH1DWBAqM4TXERYHerCL9RCdnVG+SdsTI/PLsXzjoCGR4XdIZB
	 NSPpqCXHWFxs0xYPD9ID0mO8clIczfb6/wcyJOGDCvSejWsjeK+/s/0FDmuv8IX8EG
	 hi/xaZvhUVH/k73V0Dp3J/WQ/opXA1TCmjcoSgZKeWJ/3PXeuqzgIqhTWvJHo+xwYT
	 OURCZAk/5BrEXcYm8RMhH2GC0jfCqaFis3tkCeUvDDXaXvn/GDRVbJXy4GmBvFFjDd
	 3SKyCRpMoAAKw==
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tab-elections@lists.linuxfoundation.org
Subject: FINAL REMINDER: 2022 LF TAB election
Date: Sun, 11 Sep 2022 05:28:05 -0600
Message-ID: <871qsif8vu.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

I figured I'd spam the world one last time to remind everybody that the
election for the Linux Foundation Technical Advisory Board starts
tomorrow (Monday) morning.

- There is still time to nominate yourself to serve on the TAB

- There is also still time for people who will not receive a ballot
  automatically to request one.

Instructions for both actions are appended.

To be able to vote in the election, be sure to enable your email with
CIVS (https://civs1.civs.us/) or you will not receive the voting
instructions.

Thanks,

jon  (for the LF TAB)

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


