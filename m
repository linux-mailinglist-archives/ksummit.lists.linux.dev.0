Return-Path: <ksummit+bounces-1136-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF97A2AA2
	for <lists@lfdr.de>; Sat, 16 Sep 2023 00:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76A81C20A77
	for <lists@lfdr.de>; Fri, 15 Sep 2023 22:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6D11B27C;
	Fri, 15 Sep 2023 22:48:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B218E1B
	for <ksummit@lists.linux.dev>; Fri, 15 Sep 2023 22:48:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bf55a81eeaso21485605ad.0
        for <ksummit@lists.linux.dev>; Fri, 15 Sep 2023 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694818086; x=1695422886; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5fUw8h6mNsxQWBA4lEgSLXrFHTjo5HwYKRi/P/0ckPQ=;
        b=W1OZFNVrTwmC+RMKplFk+ijr6DPTttHaATev5JPVkvyXrYKMNK9uCgDf+koAUuBMdB
         2FsFdWuir8ceuDZcoUOPICmtwbGrGgR++qq4IUCTHxjfVJzSIT5+/eGt+G8knyOKVFZe
         J3idCwUof9b3BnxKwrcYX/wdB8n7dk/WsLdAqoPyc/H6Zxi31BGzPaafqW6BXan7q8Gf
         ZVwlLg8w3lxoHA9A6Dk4QXwQVrJgve61Fbyi5JEbYHL5PH1kR+kZVdCUWydxGtneHjZJ
         QbToA0BA4YnPa/Jf8wbLoGoz/85i+B5wYEVOnAFUuo4lCinOJId9GoNM0+ecnHsjLBcr
         4nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694818086; x=1695422886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fUw8h6mNsxQWBA4lEgSLXrFHTjo5HwYKRi/P/0ckPQ=;
        b=ww3bYUwR2Gt310izy3s7j6vL70Ia4QTLxz+IGO8mBXlh6OEfb8QgjpZFZWjWKfcSYa
         wjBrRJ3tjXFbiEXYxeguI7jlf670poLQql/2WyPa3nz60Q+iinnCfLQ9jA5YhjqWKjqX
         1SYlbzpT/9xIejEe55+uUSVTbJd5NuHqDnlTUJclck8y5bS2SOu4ugezKmsrsb3YRbQu
         GCragZAPM6GJU9cK5RuFKfMvM3rdYEzNobO4PKN69XiNQEB445nqus4eeI2EJqPJt362
         8ET0nd9QsHy77wi0ApUjmKGSepW0T7rJthcw/wivtkd1pRr7iZTy3t+3Tg6pNhCmaWvM
         52MA==
X-Gm-Message-State: AOJu0YzfrkyzPtGFxbQapHSinJn06at1MWjM8pAaW8aZnwmjQSp840YM
	uUE1sNu6VDqeW8dwHgz4sFbX2g==
X-Google-Smtp-Source: AGHT+IHletiL7BTr/QBfiHHzaA3dWTl8WZbcJDBbI8Co76u8+a6kCLIYDKo7wT9jl0pN+0iAXCrlKQ==
X-Received: by 2002:a17:903:2783:b0:1c3:749f:6a5d with SMTP id jw3-20020a170903278300b001c3749f6a5dmr2865996plb.4.1694818085727;
        Fri, 15 Sep 2023 15:48:05 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id t16-20020a170902e85000b001c1f161949fsm3991862plg.96.2023.09.15.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 15:48:05 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qhHbW-001Ebp-1c;
	Sat, 16 Sep 2023 08:48:02 +1000
Date: Sat, 16 Sep 2023 08:48:02 +1000
From: Dave Chinner <david@fromorbit.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQTfIu9OWwGnIT4b@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>

On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
> On Wed, 13 Sept 2023 at 09:52, Eric Sandeen <sandeen@sandeen.net> wrote:
> >
> > Isn't it more typical to mark something as on its way to deprecation in
> > Kconfig and/or a printk?
> 
> I haven't actually heard a good reason to really stop supporting
> these. Using some kind of user-space library is ridiculous. It's *way*
> more effort than just keeping them in the kernel. So anybody who says
> "just move them to user space" is just making things up.

No filesystem developer thinks that doing a whole lot of work to
move unmaintained, untestable fs code from the kernel to an
unmaintained, untestable (and likely broken) fs library in userspace
is a viable solution to any of the problems being discussed.

There's a whole lot more to this discussion than "what to do with
old, unmaintained filesystem code".

> The reasons I have heard are:
> 
>  - security
> 
> Yes, don't enable them, and if you enable them, don't auto-mount them
> on hot-pkug devices. Simple. People in this thread have already
> pointed to the user-space support for it happening.

This is just a band-aid. It does nothing to prevent kernel
compromise and is simply blame-shifting the inevitable kernel
compromise to the user because they had to explicitly mount the
filesystem. It's a "security theatre" solution at best.

Indeed, it does not address the frequently requested container use
cases where untrusted users (i.e. root in a container) need to mount
filesystem images.  This is a longstanding feature request we really
need to solve and ignoring it for the purposes of knocking down a
strawman really doesn't help us in any way.

Put simply, what we really need is a trust model mechanism that
allows all the kernel supported filesystems to be mounted by
untrusted users without any risk that the kernel could be
compromised by such an operation.

That's where lklfuse comes into the picture: it allows running the
kernel filesystem parsing code in an isolated userspace sandbox and
only communicates with the kernel and applications via the FUSE
interface.

IOWs, we get *privilege separation* with this lklfuse mechanism for
almost zero extra work on all sides of the fence. The dangerous
stuff occurs in the sandboxed user process so the risk of kernel
compromise is greatly minimised and the user and their applications
can still access it like a normal kernel filesystem.

And because it uses the kernel filesystem implementations, we don't
have a separate codebase that we have to maintain - we get
up-to-date filesystem implementations in userspace for free...

To go back to your original concern about avoiding the removal of
unmaintained filesystems, once we get a robust trust model mechanism
like this in place we we can force them to be mounted through the
supported privilege separation mechanism. Then they can't compromise
the kernel, and the vast majority of the "untested, unmaintained
code that parses untrusted data in kernel space" concerns go away
entirely.

IOWs, if we deal with the trust model issues in a robust manner,
there is much less need for drastic action to protect the kernel and
users from compromise via untestable, unmaintained filesystem code.
Your argument for keeping them around indefinitely *gets stronger*
by addresing the security problems they can expose properly. Hence
arguing against improving the filesystem trust model architecture is
actually providing an argument against your stated goal of keeping
those old filesystems around for ever....

At this point, the only concern that remains is the burden keeping
these old filesystems compiling properly as we we change internal
APIs in future. That's another thing that has been brought up in
this discussion, but....

>  - "they use the buffer cache".
> 
> Waah, waah, waah.

.... you dismiss those concerns in the same way a 6 year old school
yard bully taunts his suffering victims.

Regardless of the merits of the observation you've made, the tone
and content of this response is *completely unacceptable*.  Please
keep to technical arguments, Linus, because this sort of response
has no merit what-so-ever. All it does is shut down the technical
discussion because no-one wants to be the target of this sort of
ugly abuse just for participating in a technical discussion.

Given the number of top level maintainers that signed off on the CoC
that are present in this forum, I had an expectation that this is a
forum where bad behaviour is not tolerated at all.  So I've waited a
couple of days to see if anyone in a project leadership position is
going to say something about this comment.....

<silence>

The deafening silence of tacit acceptance is far more damning than
the high pitched squeal of Linus's childish taunts.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

