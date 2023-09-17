Return-Path: <ksummit+bounces-1140-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDC7A36CD
	for <lists@lfdr.de>; Sun, 17 Sep 2023 19:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2C61C21492
	for <lists@lfdr.de>; Sun, 17 Sep 2023 17:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF49B6AA4;
	Sun, 17 Sep 2023 17:31:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597363B3
	for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 17:31:17 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bf8b9c5ca0so61852051fa.0
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694971875; x=1695576675; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3LaHPsqUpXWOJt89sEmNMFWS6fftJzEZe6i+AFxGXb0=;
        b=NjTXURcBnHEDSNwULPPdQk0xL339M27mcPyrYCjsmDD3W9s1UIT40+9/hAufU5IhJZ
         B8ipCIM1H7t5aYGHmvu59m+P6ls3dfT+aiumsjWfTP+hXhOyB/jeCeJTpFn4RBGPug+A
         5rbYL03eTMykY5J8ufOspOrOYlu2ib9lQD8Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694971875; x=1695576675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LaHPsqUpXWOJt89sEmNMFWS6fftJzEZe6i+AFxGXb0=;
        b=VVYezTmS7SvZ/fWK0WGj3il8GHIb6sEl/j/OMgBy1tk7uNDMAxioS+Xw1VCnfGRPDR
         rljuTOzm3v1A1BdHgpwJ/AGeOwshf1IThRrFqCJCwhdKk0s5Aex1CUf6EBI0UPFGJkfr
         yteuFqAFl53k4hPjgQYUpeCDY9COhI3qV0Op5h6erb+DJNazM83QbzqCpqstfV9gM4Tj
         j65d66nilt6ZEGVgUvk4V0wUA8gC+BaszipADMANPiq2xOygKSd7rOhejeuZMxKTDjl1
         mwYLVQ3Heu5X+GV64QTZSCjNSGYAoNteQ87s9WLZ+k2Ezz6YfCPU6YURPp+/mG57wD/1
         8SFQ==
X-Gm-Message-State: AOJu0YyZO0xvy9cbc9DwEhNkJJR/3140mG0DEAx2oYX6vgdWwB4lcDj2
	/OXjyeYwq4sySjaC7F/OJeio/fkh/5Mb9F/cyYOf8QQT
X-Google-Smtp-Source: AGHT+IFSu3foSpTtUmG6SO9the3Wb30fwA9GpcwcX6R/60Otbhnxj6jYGbrVbzd9vNIoIyO30AzZbQ==
X-Received: by 2002:a2e:9902:0:b0:2bc:d38e:b500 with SMTP id v2-20020a2e9902000000b002bcd38eb500mr6122880lji.42.1694971875256;
        Sun, 17 Sep 2023 10:31:15 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id f11-20020a2ea0cb000000b002b6e13fcedcsm1707566ljm.122.2023.09.17.10.31.13
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 10:31:14 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50307acd445so1469688e87.0
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 10:31:13 -0700 (PDT)
X-Received: by 2002:a05:6512:20c4:b0:500:ac76:4a61 with SMTP id
 u4-20020a05651220c400b00500ac764a61mr5425444lfr.65.1694971873289; Sun, 17 Sep
 2023 10:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area> <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
In-Reply-To: <169491481677.8274.17867378561711132366@noble.neil.brown.name>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Sep 2023 10:30:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
Message-ID: <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: NeilBrown <neilb@suse.de>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>, 
	Steven Rostedt <rostedt@goodmis.org>, Guenter Roeck <linux@roeck-us.net>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 18:40, NeilBrown <neilb@suse.de> wrote:
>
> I'm not sure the technical argument was particularly coherent.  I think
> there is a broad desire to deprecate and remove the buffer cache.

There really isn't.

There may be _whining_ about the buffer cache, but it's completely
misplaced, and has zero technical background.

The buffer cache is perfectly fine, and as mentioned, it is very
simple. It has absolutely no downsides for what it is.

Sure, it's old.

The whole getblk/bread/bwrite/brelse thing goes all the way back to
original unix, and in fact if you go and read the Lions' book, you'll
see that even in Unix v6, you have comments about some of it being a
relic:

    "B_RELOC is a relic" (p 68)
     http://www.lemis.com/grog/Documentation/Lions/book.pdf

and while obviously the Linux version of it is a different
re-implementation (based on reading _another_ classic book about Unix
-  Maurice Bach's "The Design of the UNIX Operating System"), the
basic notions aren't all that different. The detaisl are different,
the names have been changed later ("sb_bread()" instead of "bread()"),
and it has some extra code to try to do the "pack into a page so that
we can also mmap the result", but in the end it's the exact same
thing.

And because it's old, it's kind of limited. I wouldn't expect a modern
filesystem to use the buffer cache.

IOW, the buffer cache is simple and stupid. But it's literally
designed for simple and stupid old filesystems.

And simple and stupid old filesystems are often designed for it.

Simple and stupid is not *wrong*. In fact, it's often exactly what you want.

Being simple and stupid, it's a physically indexed cache. That's all
kinds of slow and inefficient, since you have to first look up the
physical location of a data file to even find the cached copy of the
data.

It's not fancy.

It's not clever.

But the whole "broad desire to deprecate and remove" is complete and utter BS.

The thing is, the buffer cache is completely pain free, and nobody
sane would ever remove it. That's a FACT. Do these two operations

      wc fs/buffer.c fs/mpage.c
      git grep -l 'struct.buffer_head'

and ponder.

And here's a clue-bat for anybody who can't do the "ponder" part
above: the buffer cache is _small_, it's _simple_, and it has
basically absolutely no effect on anything except for the filesystems
that use it.

And the filesystems that use it are old, and simple, but they are many
(this one is from "grep -w sb_bread", in case people care - I didn't
do any kind of fancier analysis):

      adfs, affs, befs, bfs, efs, exfat, ext2, ext4, f2fs, fat,
      freevxfs, hfs, hpfs, isofs, jfs, minix, nilfs2, ntfs, ntfs3, omfs,
      qnx4, qnx6, reiserfs, romfs, sysv, udf, ufs

And the other part of that "pondering" above, is to look at what the
impact of the buffer cache is *outside* those filesystems that use it.

And here's another clue-bat: it's effectively zero.  There's a couple
of lines in the VM. There's a couple of small helpers functions in
fs/direct-io.c. That's pretty much it.

In other words, the buffer cache is

 - simple

 - self-contained

 - supports 20+ legacy filesystems

so the whole "let's deprecate and remove it" is literally crazy
ranting and whining and completely mis-placed.

And yes, *within* the context of a filesystem or two, the whole "try
to avoid the buffer cache" can be a real thing.

Looking at the list of filesystems above, I would not be surprised if
one or two of them were to have a long-term plan to not use the buffer
cache.

But that in no way changes the actual picture.

Was this enough technical information for people?

And can we now all just admit that anybody who says "remove the buffer
cache" is so uninformed about what they are speaking of that we can
just ignore said whining?

                    Linus

