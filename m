Return-Path: <ksummit+bounces-2566-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4ABE44B3
	for <lists@lfdr.de>; Thu, 16 Oct 2025 17:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44EE93BAD7D
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A0E34BA5A;
	Thu, 16 Oct 2025 15:38:00 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB84205E3B
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760629079; cv=none; b=WE3SRZcFhKRC4mnElLSTP0M7v8gzoC0BYDs90ABHtR7KxX/jHyGo/nowY86OL/lqqT7B8oREj3BruS1zP2nbNwQlRNHU1DA6cSneTUds+fKGlRXE4XVsYZEw3FloUEuC0iFhZ6RoLSjqln5XuQ7KejxV57gv7b8BBcP1usewhDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760629079; c=relaxed/simple;
	bh=JqJ/73D9eRNpk/Wbggm/dyFYdIv1IOHtkmUncgdvnWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tn5WV77RlJIT6W/xxl/OGNYniH0PuFwb52gSrSPFVfsiqJvGP1p3+94zEEBhCFUtK3TPXPCjMCqU/EGe4bgw1FePfsYS6mnlDG7OvZ09yeEAtHtWv+AHCL5+0SYRs2GOb8TZGl+jPqd7IlUWVVJS6GItvDXjKqokmivTCEJi4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 94B3BC010E;
	Thu, 16 Oct 2025 15:37:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 5C87F2002B;
	Thu, 16 Oct 2025 15:37:47 +0000 (UTC)
Date: Thu, 16 Oct 2025 11:37:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Rob Herring <robherring2@gmail.com>, Konstantin Ryabitsev 
 <konstantin@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com,
 Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016113757.2e3fff57@gandalf.local.home>
In-Reply-To: <76340e9a1adf2f73b624992ae2da251826188b95.camel@HansenPartnership.com>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
	<2025101448-overtake-mortality-99c8@gregkh>
	<68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
	<20251015-versed-active-silkworm-bb87bd@lemur>
	<CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
	<CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
	<2025101631-foyer-wages-8458@gregkh>
	<892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
	<2025101639-thwarting-press-f0f7@gregkh>
	<ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>
	<20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
	<CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com>
	<76340e9a1adf2f73b624992ae2da251826188b95.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: do36yqg8xehtz4kdtbbj5cenr4aocoou
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5C87F2002B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/yTaIFUGoFcuX20EeOTB6xB/OC+40ixR0=
X-HE-Tag: 1760629067-736613
X-HE-Meta: U2FsdGVkX1961JD+oH1zvDmhVBJynFfxqoqafhfTa/C2+YMn1Mma0nPzy2qkT2X5yjeryp5hZQE9SuNfLliX8ASr3MwYxWD0TYfzuEtNNx0USYEQCe866E0yp8kG5reRiZ+A+RU1y2lnFn5wdLBDr2Ghl4t4M4Uiqnj6rIFO8TkUUgxswemJ4WVOAU3b3ZBeWXmpibZSiIT8+XA7x6nUtJU4Po8TJ87N4Bqg6hE9E29BJPYKwPIN9+E5sxTNsFRBrB/Qiovea1r8vhjfvOqEkPTGfXdmvKEgEj33XZSnOqraxucM0snd/aSUsdEBAN+qLyrlWY6Mifc1bVecUGSgeziW1RIwO1LRIq/piDcp0d79I+t8BaMO9T1OZQCqvYwA

On Thu, 16 Oct 2025 11:07:40 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Thu, 2025-10-16 at 09:58 -0500, Rob Herring wrote:
> [...]
> > With a new atom_type, there doesn't seem to be a simple way to turn
> > on or off a field in git-log. We'd need '--pretty=linus' or some new
> > git config setting.  
> 
> Well, not on a per field basis, no.  --pretty=raw will give you
> everything, though and "grep ^message-id" would pull it out, which I
> think would work for scripts.  If humans want to use it, I think, per
> Linus, we'd have some option to convert it to a clickable something.

It would be also nice to see it in the comment section of a git commit.

The part after:

  # Please enter the commit message for your changes. Lines starting
  # with '#' will be ignored, and an empty message aborts the commit.

-- Steve


