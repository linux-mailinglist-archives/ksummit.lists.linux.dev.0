Return-Path: <ksummit+bounces-2643-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ECBC7C05B
	for <lists@lfdr.de>; Sat, 22 Nov 2025 01:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 206804E28F4
	for <lists@lfdr.de>; Sat, 22 Nov 2025 00:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD23F21D3E8;
	Sat, 22 Nov 2025 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMF58gDy"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAB219A8E;
	Sat, 22 Nov 2025 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772132; cv=none; b=AghoMNZp9AQPLe6R7hcWQ5asoQMy0yeH62+tz5u5B1ZtXc1YJs/AcxSy8h2pjTQIbhBVFj0zXpoT6/dniKWBS6l1PczVSQaDq1R1a+V7yGYyC9mxtEx4tNi80vgFhrCAclCgxJlnnwuH1lWYohfdK8VzH+KcrxoBX4c3Fu9XLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772132; c=relaxed/simple;
	bh=4TqWPjNfFywo6teVc9vYsRsvM90uFubxjLUmBBdLQiA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rhzQdaDtb7ObrlVHgl2x4ULZ0Rh9EvBD7aWzQdu14UiXjMsEuJHry/Wr2LIsOTecvqqVS7eDqgnS+lqnHSGpEsfiHBbIfww3WJS/3W414DUinC0RvjIfS1MsO6r8eZmTbxV5W0QzwoUIuETid7LiNQIVv0py5tv551Xjj+KmLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMF58gDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63E2C4CEF1;
	Sat, 22 Nov 2025 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763772131;
	bh=4TqWPjNfFywo6teVc9vYsRsvM90uFubxjLUmBBdLQiA=;
	h=From:To:Subject:Date:From;
	b=cMF58gDy2gIwsUT91ZhcoNon+s+LnYdKA0UAfPpiO5EuxjZ/PUohfjHpNTzu6MjfN
	 Qc6DHVFUEG7OCH2OQELJeRulAEzlWXMFEZoMZmO3q6bDRUAQWUlsux/Q+eDt9bww10
	 Z2r8vt+I3dCuRQ6KmP3Vq3mxRPHxQeXqR1lVrnrPyYhXG69cnc1gc7QsCQRnCaSLnR
	 OFoxCfHeNGijlBdr9GtlCuwMMuXaMPB0QxfgpVSJFT0jxB6PSc6b3kQXEgaHhh46b8
	 wpkOFIQj2T3f9XGLZH38py6NQPyztzQnCluEM64zGN3dIw19fr4tQWyQyQdJbAcMg8
	 QG3n6MrJt/Hiw==
From: Miguel Ojeda <ojeda@kernel.org>
To: tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - call for candidates
Date: Sat, 22 Nov 2025 01:41:47 +0100
Message-ID: <20251122004147.1655175-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2025 election for membership on the Linux Foundation Technical
Advisory Board (TAB) will be held electronically after the 2025 Linux
Plumbers Conference, from December 13 to 20.  This announcement covers
both the call for candidates and the details of voting in this election.

The TAB exists to provide advice from the kernel community to the Linux
Foundation and holds a seat on the LF's board of directors; it also serves
to facilitate interactions both within the community and with outside
entities.  Over the last year, the TAB has overseen the organization of the
Linux Plumbers Conference, advised on the setup of the kernel CVE numbering
authority, worked behind the scenes to help resolve a number of contentious
community discussions, worked with the Linux Foundation on community
conference planning, and more.

The public minutes from TAB meetings can be found in this repository:

    https://git.kernel.org/pub/scm/docs/tab/tab.git/

Note that there will be an "ask us anything" session with the current TAB
at the Linux Plumbers Conference; it is currently scheduled for 15:00 on
Friday, December 11:

    https://lpc.events/event/19/contributions/2260/

CALL FOR NOMINATIONS

The TAB has ten members serving two-year terms; half of the board is
elected each year.  The members whose terms are expiring this year are:

  - Jonathan Corbet
  - Greg Kroah-Hartman
  - Sasha Levin
  - Steve Rostedt
  - Ted Ts'o

The members whose terms expire next year are:

  - Kees Cook
  - Dave Hansen
  - Shuah Khan
  - Miguel Ojeda
  - Dan Williams

Anybody who meets the voting criteria (described below) may
self-nominate to run in this election.  To nominate yourself, please
send an email to:

    tech-board-discuss@lists.linux.dev

Please include a short (<= 200 words) statement describing why you are
running and what you would like to accomplish on the TAB; these
statements will be collected and made publicly available.

The nomination deadline is 17:00 JST (GMT + 9) on December 13.

VOTING IN THE TAB ELECTION

The criteria for voting in this year's TAB election are unchanged from last
year.  To be eligible to vote, you must have at least three commits in a
released mainline or stable kernel that:

  - Have a commit date in 2024 or later
  - List your email in a Signed-off-by, Tested-by, Reported-by,
    Reviewed-by, or Acked-by tag.

Everybody with at least 50 commits meeting this description will receive
a ballot automatically; they will receive an email confirming this
status shortly.  Eligible voters with less than 50 commits can receive a
ballot by sending a request to tab-elections@lists.linuxfoundation.org.

We will, once again, be using the Condorcet Internet Voting Service
(CIVS) https://civs1.civs.us .  This is a voting service focused on
security and privacy.  There are sample polls on the website if you would
like to see what a ballot will look like.

Please contact tab-elections@lists.linux.dev if you have any questions.

