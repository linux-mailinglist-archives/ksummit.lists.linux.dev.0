Return-Path: <ksummit+bounces-2650-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF74CA74D7
	for <lists@lfdr.de>; Fri, 05 Dec 2025 12:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCEE53098FA2
	for <lists@lfdr.de>; Fri,  5 Dec 2025 11:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D4932471D;
	Fri,  5 Dec 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZkuZioi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F65329394;
	Fri,  5 Dec 2025 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932796; cv=none; b=a2fzMsl4zHGMoUEJrCJ/VL/8duXyEG4DCYwFvJi7YhYzy3N27cfa7XDchW0a6iCzwjPrJY2ZejwKRuQZOoHrKhvy0zrLwO3hbkXnhb5TSehzSKo/bPl3DmUG3ip4gTfCBbmFU0/C2J3i/BdIW2+lu+T0l6ANGlwIij8Kgfj5gQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932796; c=relaxed/simple;
	bh=Gi0ThXMiDJLndih3exY9L0EeSGb49IAAqz3neLeQrz8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agViiIZc/+sDOoYgkysvkUAfFwKDMfLIDF15vHx+2B9WA09Tb6G65tTJCD6R9mRO7XrXsmCaVB467SsLKBtNpF2fm2Jpcm6rsLjqGJWJ4PNGJN7h0p3Uaeuv9GfxVwdi3R3WyV8Ruv7+J6Wql7DwobrV8psO8Xamk/M0G6mOZUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZkuZioi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D16DC4CEF1;
	Fri,  5 Dec 2025 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764932795;
	bh=Gi0ThXMiDJLndih3exY9L0EeSGb49IAAqz3neLeQrz8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JZkuZioimCjwss0GFXSv+MQfuhhZmINJRE13KXiU9LUsOtfmY+qQJyVQheLWdMatK
	 GGWRje5aChdrHbKYXFxli4Mun314rDz6mOQbxnOpnjiHQzb0BqLa3mBvhtV5jQXNMF
	 dCT+o+skL8TAXBSkwuPfQduWLw7bTYGOoWUymV+Gt9EB+W/EPhwD3kE/v/SHZ2tACN
	 JwZNHhEyfgufd9A4IsIaWT9TrASydJ4MU6Yu/q0/kiYgWlrTzhJaRPVV4wgGFcDj/F
	 si4N/rM08vk/EehTueCebXwrBYmRZoPWDlDsrhyIqPVFzKhD19CyVs+dA0JWqfGxkp
	 xXAKmQjR+oWZQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - update
Date: Fri,  5 Dec 2025 12:05:40 +0100
Message-ID: <20251205110541.2174201-1-ojeda@kernel.org>
In-Reply-To: <20251122004147.1655175-1-ojeda@kernel.org>
References: <20251122004147.1655175-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a quick update on the upcoming election for five seats on the Linux
Foundation Technical Advisory Board.

 - Everybody who is eligible for an automatic ballot has been sent an email
   to that effect.  If you did not receive the email (and feel you should
   have), or if you are eligible to vote and would like a ballot, please
   contact us at tab-elections@lists.linux.dev.

 - The nomination period is open until 17:00 JST (GMT + 9) on December 13.
   Serving on the TAB is a unique opportunity to help the community; if you
   are interested, please do not hesitate to put your name forward.

 - The "ask us anything" session with the current TAB at the Linux Plumbers
   Conference has been rescheduled for 9:00 AM on December 12:

       https://lpc.events/event/19/contributions/2260/

Eligible voters should be sure to enable their email address in the CIVS
system prior to the start of voting.

The (updated) original announcement follows with all the details.

Thanks!

Cheers,
The LF TAB elections team

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
at the Linux Plumbers Conference; it is currently scheduled for 9:00 on
Friday, December 12:

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
ballot by sending a request to tab-elections@lists.linux.dev.

We will, once again, be using the Condorcet Internet Voting Service
(CIVS) https://civs1.civs.us .  This is a voting service focused on
security and privacy.  There are sample polls on the website if you would
like to see what a ballot will look like.

Please contact tab-elections@lists.linux.dev if you have any questions.

