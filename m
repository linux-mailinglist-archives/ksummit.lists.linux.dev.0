Return-Path: <ksummit+bounces-1289-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAAA909B6A
	for <lists@lfdr.de>; Sun, 16 Jun 2024 05:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A13A1F21F2A
	for <lists@lfdr.de>; Sun, 16 Jun 2024 03:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D70C51C50;
	Sun, 16 Jun 2024 03:28:08 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144DD944F
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 03:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718508488; cv=none; b=Gl3A0DGhDHqzc/XqZrHyeygpjQF7xWPUe4usovabIT2GGOyEaJRsmXihsFkXpVqdvRvw85g7d1EXINzN30jSO/rWBUv+BcmWnif/W1fgdPkM3DwNnDNJ//kHTtS28c21OiWJxMt1Y/9jFLKsZhWACNVGKDshRr0ATmXZuh2eeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718508488; c=relaxed/simple;
	bh=AB7aCfisqrjIKNL8MAnIuqM1t5D+MtQ8gd1EG5KvP/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Icyatz83cto22KoJw1Rv39+u/fcIudcS5BUeWYGqdvUAvxSpgToHsb5E4Vg5VpT52bEnrV8te/jqVI2/Bl0CJNABUpQiT8hay3pTpH2WzxQqyt+Ul3udRt8xVTzqrpCttUDt1iYbc5h+X0ctBF9/z8RWRf58j9dgePgX8ptpijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F9C3277B;
	Sun, 16 Jun 2024 03:28:06 +0000 (UTC)
Date: Sat, 15 Jun 2024 23:28:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai
 <tiwai@suse.de>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan
 Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240615232831.6c7f27dd@gandalf.local.home>
In-Reply-To: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<20240613-rustling-chirpy-skua-d7e6cb@meerkat>
	<87plsjoax6.fsf@mail.lhotse>
	<CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jun 2024 18:13:57 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 14 Jun 2024 at 07:29, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Message-Id: sucks, I want a link I can open with a single click.  
> 
> !00% agreed.
> 
> There is no way in hell I will endorse adding more of those completely
> *idiotic* "Message-ID" things.
> 
> Yes, people use them. It's a damn shame.
> 
> There is no excuse for that completely broken model. It's objectively
> and unquestionably worse than having a "link".
> 
> Here's the thing: if that message-ID isn't public, then that line
> SHOULD NOT EXIST and is an actual real problem. I personally look at
> those, and go "is that actually available on lore?"
> 
> And if that message-id _is_ public, then it has a link, and it's much
> easier for people to check.
> 
> Ergo: there is absolutely zero reason to ever use Message-ID.
> 
> People need to stop advocating that sh*t.
> 

After trying it for a brief period, I quickly came to the same conclusion.
I didn't like it because right after implementing it, I needed to get back
to the conversation and found I could no longer simply click on a link, and
I abandoned the "Message-Id" idea.

But I really like having a link to the patch I pulled, even if there was no
conversation about it. I use it for finding previous versions and so on,
which is useful for me.

Now, one day you looked at one of my "Link:" tags and was disappointed that
it didn't have a discussion behind it. I would like to differentiate links
that have a discussion with those that just are "I pulled it from here". I
don't like that I use "Link:" for both.

I prefer that "Link:" goes back to a discussion, but I would like a
separate tag for where the patch came from. What would you suggest?

1) Just keep using Links, and we can figure it out when we click on it.

2) Giving it a separate name:

 a) "Pulled-from:"
 b) "Submission:"
 c) Something else

?

-- Steve

