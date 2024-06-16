Return-Path: <ksummit+bounces-1290-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9E909B9E
	for <lists@lfdr.de>; Sun, 16 Jun 2024 07:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 634C4B21296
	for <lists@lfdr.de>; Sun, 16 Jun 2024 05:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01CC16D33B;
	Sun, 16 Jun 2024 05:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EtT/zcNl"
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E316D4C4
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718514004; cv=none; b=ukuTw1nNDmqj6FOaHHHTrmYAvqLUhiBmRyykLLslk/G32R7M79k3VU2Hu4nE1CYcv55GuKP3NKXnh23BLLKqPyl+1C5v81kbAYMaQieMiaimh1u2+WjPTk5mQuuYwDpdDh6RM/B/CWP1Azs+dIYdYyq5YJ5ysCIlG3eeS0tBVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718514004; c=relaxed/simple;
	bh=5MD2JKZ93K18vZ6Oy2WnxULdyKkOgHexTV1SWx+vREA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2oQJrf0YtPEzb99cW3IFZLBig6OPTs7nh269mJ7D2FxnXLSmTNklMVyJoG2bzEmG+nnBLrMIB1HQsZGe7oJ0kAqMrLPm4Nq+pxKWg9Zfxq2vNG8asGL1L4srm10ty2xd9M5Elp3uYFv0CjGanvLShm3b1+FjxS35rMAKJzSHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EtT/zcNl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso4745337e87.1
        for <ksummit@lists.linux.dev>; Sat, 15 Jun 2024 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718514000; x=1719118800; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4U/YvmCmOfEXffN2FWJYlrWDG3ZGnLWF5/k92g5fPk=;
        b=EtT/zcNlh3hCAnh9SeLjm0a9uD3wYSggpELMaKQaRHj+CifShlrAWvx3GajGayWZeg
         gr5z8gsIKLLdjBWK9kf6WjLNLQhPUd8EGhO4MpodbMLtZdtJwIZCUVwi4KJkEw0dJm9K
         4UNZ8/kSOg+d1JRC9TEWMEjsMbXBIHF9dNhOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718514000; x=1719118800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4U/YvmCmOfEXffN2FWJYlrWDG3ZGnLWF5/k92g5fPk=;
        b=Ip/i3KMDXuaDXOFxl5doCKr9pcRulkUegVB/o2mJuuXIqa6svZqJj+X+sRj2C+XeZk
         JbOHxnyM7ffruzu1rxs8C2x32dAiwl6qr/xXEvV+vXzoMHsZ9d3/vWXO7JWE8sWcBeRH
         /9diKLhFBgbX+UB9Z/2ajQR7CLU06fbUiW9w0tPH/z0HyK/OCNkPwTp2KUbXyt7m7yRD
         Mat02tyR/CUl5lOXfhBwEi7JEXJzGWkBD5L5le3hhmXxYxzZXy3nqwaTf0qY8FQOPwEp
         zELiCTue8zHh6JUWCCJIv5h6V07T690jItdB523ivYoOaSFErvEwNYPWv+814ikxBjPK
         5A2A==
X-Forwarded-Encrypted: i=1; AJvYcCXrFFJEhfW71ns9kn3doSsq30+WlNxLXyPXC5v87jpvOAupZn2SQRKE2IgUnd9pJO3Vv0Vnt+vdOwH5f2Ji4WZC/azieQdsKA==
X-Gm-Message-State: AOJu0YwGMVcna7AwQsDWHn/xkyTR+OQEO2/PJjP17V4ebV2PXrX9ukix
	iEpfXTp9XyZTAuwTqEpYD+TEIkianPhTGe6jGW+jnWdeU/5zih0JywLOSiqe2wAjLZoepnf8oYH
	AHao=
X-Google-Smtp-Source: AGHT+IFJiddCIquhyE8Vb8x/ZqQ2f5ZxYO6wHQq3worN+kTLfFbKdz+Kk7yvuijxb3Ru31UP+DTQbg==
X-Received: by 2002:a05:6512:4012:b0:52b:c296:9739 with SMTP id 2adb3069b0e04-52cafd53b1bmr4021573e87.41.1718513998268;
        Sat, 15 Jun 2024 21:59:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed0ea4sm368065666b.116.2024.06.15.21.59.57
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 21:59:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so509035a12.3
        for <ksummit@lists.linux.dev>; Sat, 15 Jun 2024 21:59:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwUJaodceUKIe0a8b/jKlVAIFeGwkZbsMgtds2dps1Cv/NO1S8IcupBfWTIZkdmyw8YvZ0nOoaZKSs4jqdCbbYw4aB7DQEiw==
X-Received: by 2002:a50:8d59:0:b0:57c:5bdd:178d with SMTP id
 4fb4d7f45d1cf-57cbd677015mr5569715a12.6.1718513996900; Sat, 15 Jun 2024
 21:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com> <20240615232831.6c7f27dd@gandalf.local.home>
In-Reply-To: <20240615232831.6c7f27dd@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 15 Jun 2024 21:59:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
Message-ID: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Jun 2024 at 20:28, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I prefer that "Link:" goes back to a discussion, but I would like a
> separate tag for where the patch came from. What would you suggest?

I really don't see the advantage of a separate tag name, and I see
actual and immediate disadvantages.

The thing is, I want commit messages to be links, because I do *NOT*
want people to be in the situation where they ask themselves "how do I
look this ref up"?

Yes, a message-ID is often easy to just plug into lore. But as you -
and others - already noted, making it a link means that you don't have
to "plug it into X" at all, and it just works in many different
contexts.

And lore does not index all email.

Which gets me to the other reason I want a link, and why I want to
*name* it "Link".

Because when I say "link", I very much mean exactly that.

It's not an URI, the key part really is that "L" for Link. It needs to
actively point to something on the internet.  It's not some random
uniform resource identifier, it's an honest-to-goodness "this is the
actual link to the information"..

So I don't want things that point to something on your company intranet.

Nor do I want identifiers to something in your mailbox.

It's *not* supposed to be a message ID, exactly because to be
meaningful, it has to point to *public* data, and it has to be a real
link, and the tag name should make that clear.

And that's why the name "Link:" is important too.

Because part of this is very much a social contract: we are working on
open source, and the keyword here is open. Using a "Link" name kind of
mentally enforces that social contract.

Yes, yes, others use git for their own nefarious reasons, and if you
are working inside a company on some closed source thing, by *all*
means have tags like "Closes-bug: 54321".

But that's not what the kernel is.

We have years of people wanting to add their own meaningless "bug ID"
crap. Or other internal useless markers.

And that is *explicitly* what I don't want, and why I want it to be
completely obvious and very very explicit that the only thing that is
valid is a real public link.

And finally - if you applied the patch by just following a message ID
with basically "b4" from lore, I think the source link is almost
entirely worthless.

Here's the thing: if you applied it unchanged from lore, you already
have the email address and a date in the commit.

Are you seriously saying that you can't find it based on that?

Now, if you *base* your commit it on somebody elses work on the lists,
you should most definitely say that, and say something like

   Based on patch submission by Xyz at [1]

   Link: https://lore.kernel.org/...../ [1]

and that's _wonderful_.

But if you just did "b4 am" and applied a patch, what's the advantage
of including information that adds no real value?

So a pure source link I still find to be of *very* questionable value,
compared to things that have actual obvious real value:

 - bug reports

 - background discussion

 - pointers to earlier versions that didn't get committed

so yes, I find it almost offensive when I have to debug a problem, and
I find a Link: that I hope explains things, and all it just shows is
the SAME DAMN INFORMATION that was in the commit already, and that I
could trivially have found by just searching lore for the author and
date.

At that point, "Link:" is just wasting my time.

And I'm not making up that "search lore for author and date range"
thing. That's EXACTLY what I do. Not to find the original submission,
but to find the discussion about things. Sometimes years prior.

A few days ago, I literally did exactly that to find some background
for a commit from 2011.

Btw, as a realted issue, is why I also despise the syzkaller
convention of hiding magic noise in other tags too, like

    Reported-by: syzbot+6a038377f0a594d7d44e@syzkaller.appspotmail.com

because that's exactly the kind of "ok, how the f*%^ do I look this
up" kind of noise.

And yes, we have exactly that kind of noise in the kernel logs, and
it's wrong. I didn't make that one up.

Now, often - but sadly not at all always - we also end up having an
actual link, eg

    Reported-by: syzbot+9bbe2de1bc9d470eb5fe@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=9bbe2de1bc9d470eb5fe

so that actually says "Oh, look, _that_ is how I look up the noise".
But I'd much rather just see "Link" over "Closes", and generally to
the actual report on lore, if there was any discussion about it.
Because from a kernel standpoint, if something causes problems, the
fact that it _closed_ a bug report is not what is important, is it?
No, the reason you want to look at that link is because the fix caused
problems, and you want the background on it and the original report.

So again, "Closes" is wrong. Why? Same damn reason: make it really
really obvious that what we want is a *LINK*. Not a "syzbot ID".
That's wrong for exactly the same reason "Message-ID:" is wrong.

TL;DR:

 - if you add a "Link:" there should be some *value* to the link, over
and above "I can find this on lore by just searching for it".

- there are seldom any real reasons to use anything but "Link:", and
we have absolutely years of people arguing for their own internal
bug-IDs that argue *against* making it very very clear that it should
be a valid link

Thus endeth my rant.

             Linus

