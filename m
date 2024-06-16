Return-Path: <ksummit+bounces-1299-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA0909E12
	for <lists@lfdr.de>; Sun, 16 Jun 2024 17:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77AD91C20910
	for <lists@lfdr.de>; Sun, 16 Jun 2024 15:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC2912B82;
	Sun, 16 Jun 2024 15:06:53 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771B514F90
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718550413; cv=none; b=nsHx8G+ke1wGFqmHkD+QKV2NzeTCWcw+hoYgbhoc8Oo7GSlKOKhUQ/ZopHIYIMtI7vLgve4hni/LSiR6DcTCmbyrq8ZQClHp94sHENbYrvw/qKwKiNZWJkVW7jYCKhrlQWvu094rN0EE6wmsjDLPyUGXPYXObEIV97LO41Hc/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718550413; c=relaxed/simple;
	bh=PTkBNtHl77K8bqNxf4RmNQjzrpq1Okp0XJ08BqbkB/A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsMlb008aw65wRJGXPJmR8NgCAA+pFuvCmSLBgcU8NsZv7deD9uRFRaGu5636/uTety77bZ2dOUOrnhLFw9fVtCoXmIdywXdPA3twSCW1y6evP4t4X0nD7X3QOxQDua3YOC8hDo9fr6XD0IOj8JCczN2JLMPyEgrjrm6EoPwZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E817AC2BBFC;
	Sun, 16 Jun 2024 15:06:51 +0000 (UTC)
Date: Sun, 16 Jun 2024 11:07:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai
 <tiwai@suse.de>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan
 Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240616110718.1ddc4c68@gandalf.local.home>
In-Reply-To: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<20240613-rustling-chirpy-skua-d7e6cb@meerkat>
	<87plsjoax6.fsf@mail.lhotse>
	<CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
	<20240615232831.6c7f27dd@gandalf.local.home>
	<CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jun 2024 21:59:40 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:


> Yes, a message-ID is often easy to just plug into lore. But as you -
> and others - already noted, making it a link means that you don't have
> to "plug it into X" at all, and it just works in many different
> contexts.
> 
> And lore does not index all email.
> 

[..]

> And finally - if you applied the patch by just following a message ID
> with basically "b4" from lore, I think the source link is almost
> entirely worthless.
> 
> Here's the thing: if you applied it unchanged from lore, you already
> have the email address and a date in the commit.
> 
> Are you seriously saying that you can't find it based on that?

As you stated above. I can find it, but it takes a bit of work to do so.
Even more than a Message-Id.

> 
> Now, if you *base* your commit it on somebody elses work on the lists,
> you should most definitely say that, and say something like
> 
>    Based on patch submission by Xyz at [1]
> 
>    Link: https://lore.kernel.org/...../ [1]
> 
> and that's _wonderful_.
> 
> But if you just did "b4 am" and applied a patch, what's the advantage
> of including information that adds no real value?

Because it's an all or nothing approach. I'm not going to bother saying
"oh, there's a discussion with this patch, I'll add the link. It's I either
add a link or I don't. I have this automated to just make the link for the
current patch. I also try to use the mailing list it came from. Is it to
linux-trace-devel, or just lkml? That part tells me what the focus of the
commit was for.

Now, there's been several times I want to know a back story on some change
that was done 5 years ago. But the discussion may be on one of a few
commits to a part of code. It's nice to quickly pick the link and see where
the discussion happened. It may take 5 commits to find the discussion, as
one commit could lead to other commits. Yes, yes, I like to make verbose
change logs where I don't need to see that discussion, but unfortunately,
you can't always predict what part of a discussion would be relevant in
five years and put that into the change log.

> 
> So a pure source link I still find to be of *very* questionable value,
> compared to things that have actual obvious real value:
> 
>  - bug reports
> 
>  - background discussion

Which usually point to a source link. Especially if it is split between
several versions. One thing I'm very diligent on, and I'm starting to see
others do the same, is to have in every cover letter:

Changes since v5: https://lore.kernel.org/all/20240612021642.941740855@goodmis.org/

Where once you find the link, you can easily go back and see the
discussions from the previous link.

> 
>  - pointers to earlier versions that didn't get committed

As mentioned above, I make sure all versions point to the previous
versions, at least in the cover letters. This way you get to see all
discussions on the change of code.

> 
> so yes, I find it almost offensive when I have to debug a problem, and
> I find a Link: that I hope explains things, and all it just shows is
> the SAME DAMN INFORMATION that was in the commit already, and that I
> could trivially have found by just searching lore for the author and
> date.
> 
> At that point, "Link:" is just wasting my time.
> 
> And I'm not making up that "search lore for author and date range"
> thing. That's EXACTLY what I do. Not to find the original submission,
> but to find the discussion about things. Sometimes years prior.
> 
> A few days ago, I literally did exactly that to find some background
> for a commit from 2011.
> 
> Btw, as a realted issue, is why I also despise the syzkaller
> convention of hiding magic noise in other tags too, like
> 
>     Reported-by: syzbot+6a038377f0a594d7d44e@syzkaller.appspotmail.com
> 
> because that's exactly the kind of "ok, how the f*%^ do I look this
> up" kind of noise.
> 
> And yes, we have exactly that kind of noise in the kernel logs, and
> it's wrong. I didn't make that one up.
> 
> Now, often - but sadly not at all always - we also end up having an
> actual link, eg
> 
>     Reported-by: syzbot+9bbe2de1bc9d470eb5fe@syzkaller.appspotmail.com
>     Closes: https://syzkaller.appspot.com/bug?extid=9bbe2de1bc9d470eb5fe
> 
> so that actually says "Oh, look, _that_ is how I look up the noise".
> But I'd much rather just see "Link" over "Closes", and generally to
> the actual report on lore, if there was any discussion about it.
> Because from a kernel standpoint, if something causes problems, the
> fact that it _closed_ a bug report is not what is important, is it?
> No, the reason you want to look at that link is because the fix caused
> problems, and you want the background on it and the original report.
> 
> So again, "Closes" is wrong. Why? Same damn reason: make it really
> really obvious that what we want is a *LINK*. Not a "syzbot ID".
> That's wrong for exactly the same reason "Message-ID:" is wrong.

I can see them using Closes as a way to show that a bug in a database is in
mainline. Some tags are for computers to read and not humans. But I also
agree that there should be tags for humans as well. The same discussion I
had with Greg about "Depends-on".

> 
> TL;DR:

Usually that goes before the too long part ;-)

-- Steve

> 
>  - if you add a "Link:" there should be some *value* to the link, over
> and above "I can find this on lore by just searching for it".
> 
> - there are seldom any real reasons to use anything but "Link:", and
> we have absolutely years of people arguing for their own internal
> bug-IDs that argue *against* making it very very clear that it should
> be a valid link
> 
> Thus endeth my rant.
> 
>              Linus


