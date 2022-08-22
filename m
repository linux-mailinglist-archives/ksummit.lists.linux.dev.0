Return-Path: <ksummit+bounces-766-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08F59CBBF
	for <lists@lfdr.de>; Tue, 23 Aug 2022 00:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC021C20976
	for <lists@lfdr.de>; Mon, 22 Aug 2022 22:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5C14C72;
	Mon, 22 Aug 2022 22:51:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAA4C6C
	for <ksummit@lists.linux.dev>; Mon, 22 Aug 2022 22:51:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7BC412AE;
	Mon, 22 Aug 2022 22:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7BC412AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1661208143; bh=iwqKafgKtoHa324ilfuky7BSyJRg7gT/fs7VjGkALSo=;
	h=From:To:Cc:Subject:Date:From;
	b=aRdcQyCW/A7Z5VIL5621ZkbZtdqcnj3EO3Pl1hChdS9Y/JbZNm/KS6r+IMdWW0ECc
	 oriPpL3MNc8iZXu/N92NPWtPwXnzmyI+QJu5aE9bkhT9Mg6C0e4yUIGo6nNH2phIs0
	 7T4OxACmxmsyeCU4GrlVhd7Uki5gC4KnT6hCQXVeYloOySBPVMpGy4lrP8ecozrkqM
	 UP0D7PZF6czpdUXbeXGp0TEL4OyRCk2CzLguIUqP4FdvK/cedcQ4T3NGMm6OEnK2bn
	 DpEJbwdIBdHCOYpQPRX5Jv2jErolZIW3GENv6GjUDK1i8YAJeqapKzy2yZsUxu5uwc
	 uXxgTArttFn3w==
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tab-elections@lists.linuxfoundation.org
Subject: Technical Advisory Board election info and call for nominees
Date: Mon, 22 Aug 2022 16:42:22 -0600
Message-ID: <87ilmj6gtt.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

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

Everybody with at least 50 commits meeting this description will receive
a ballot automatically; they will receive an email confirming this
status shortly.  Eligible voters with less than 50 commits can receive a
ballot by sending a request to tab-elections@lists.linuxfoundation.org.

We will, once again, be using the Condorcet Internet Voting Service (CIVS)
https://civs1.civs.us/ . This is a voting service focused on security and
privacy. There are sample polls on the website if you would like to see
what a ballot will look like.

Please contact tab-elections@lists.linuxfoundation.org if you have any
questions.


