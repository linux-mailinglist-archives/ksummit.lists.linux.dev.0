Return-Path: <ksummit+bounces-1146-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE87A50EF
	for <lists@lfdr.de>; Mon, 18 Sep 2023 19:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3519B1C20D7D
	for <lists@lfdr.de>; Mon, 18 Sep 2023 17:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58836262AD;
	Mon, 18 Sep 2023 17:26:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CA23759
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 17:26:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50307759b65so3400206e87.0
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695058004; x=1695662804; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1k/7HPsRc+s4sU3sVF0r8fu4Hc5FoXfKZQpu2fNyRCw=;
        b=VI9Gv5sap18ZKj3yfl+aXkrICK1xpdUf3WECBv2UYcGfq7xTR6D3v+kZBMa4wMaSbv
         Mn2o+6VYd0t9fTzocJtsw8LoK9rx7VHOT/iMzbug/f0eEDe2VGx8AHFXeRdCLBokT18E
         Yy9i9E+a8DP7CAvgEDlaU6Y3EnV7jKyJ+4/sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695058004; x=1695662804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k/7HPsRc+s4sU3sVF0r8fu4Hc5FoXfKZQpu2fNyRCw=;
        b=KPHA0T+RWQUala9xZu3NvVvGKflHrYHUOeSjBKXP8y89SoXW+qca7NZnTP/Maj8K3j
         Bbap58t63rukCS75hkOrTB1ycQTxoYEIbtiM07b4kH/imUZv/7d2pNGwpTObU4YI3h+g
         YmIiEgwo201qSrKPFq3ZDINKYqntsR2B2RX1cVP0ntCb/W4hjPQQEV7nR4HdQWPCu4Q5
         Pqg15q1M9c//oB0HZ+Q875RqZvZUS/AIZgoR1g7k4A6hkILCmK/p6IA9HYLoUKb/T7Kc
         wd/7p7/v2yFsm+T8fdYH5KONzd7pBy/rLUNrxuU9xN4y+V855Wo1nuF9modL3bNIduBT
         tryA==
X-Gm-Message-State: AOJu0YzDzVmqJLoAQH5WPY5/9ZAhXhM7aAvORXSQKpogef7g720fxAql
	kZ37dcYM7EMF0nq7q8fONgidC/NjY6lQrNdBbIlADUqb
X-Google-Smtp-Source: AGHT+IGcpFPxMtnbRy/sWQk/m9X7uMmshdVuAUFmpg1Exayst3YhCHcjDcEVohwoeSGiDtn2KxZh7A==
X-Received: by 2002:ac2:420f:0:b0:503:16d6:1f0b with SMTP id y15-20020ac2420f000000b0050316d61f0bmr2706432lfh.25.1695058003807;
        Mon, 18 Sep 2023 10:26:43 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id e9-20020aa7d7c9000000b0050488d1d376sm6375686eds.0.2023.09.18.10.26.42
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 10:26:42 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so5558391a12.0
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 10:26:42 -0700 (PDT)
X-Received: by 2002:a50:ee84:0:b0:523:38ea:48bb with SMTP id
 f4-20020a50ee84000000b0052338ea48bbmr8827319edr.24.1695058002123; Mon, 18 Sep
 2023 10:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu> <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
 <20230918111402.7mx3wiecqt5axvs5@quack3>
In-Reply-To: <20230918111402.7mx3wiecqt5axvs5@quack3>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Sep 2023 10:26:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
Message-ID: <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Ts'o" <tytso@mit.edu>, NeilBrown <neilb@suse.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Chinner <david@fromorbit.com>, 
	Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Sept 2023 at 04:14, Jan Kara <jack@suse.cz> wrote:
>
> I agree. On the other hand each filesystem we carry imposes some
> maintenance burden (due to tree wide changes that are happening) and the
> question I have for some of them is: Do these filesystems actually bring
> any value?

I wouldn't be shocked if we could probably remove half of the
filesystems I listed, and nobody would even notice.

But at the same time, the actual upside to removing them is pretty
much zero. I do agree with you that reiserfs had issues - other than
the authorship - that made people much more inclined to remove it.

I'm looking at something like sysv, for example - the ancient old
14-byte filename thing. Does it have a single user? I really couldn't
tell. But at the same time, looking at the actual changes to it, they
fall into three categories:

 - trivial tree-wide changes - things like spelling fixes, or the SPDX
updates, or some "use common helpers"

 - VFS API updates, which are very straightforward (because sysvfs is
in no way doing anything odd)

 - some actual updates by Al Viro, who I doubt uses it, but I think
actually likes it and has some odd connection to it

anyway, I went back five years, and didn't see a single thing that
looked like "that was wasted time and effort".  There's a total of 44
patches over five years, so I'm looking at that filesystem and getting
a very strong feeling of "I think the minimal effort to maintain it
has been worth it".

Even without a single user, there's a history there, and it would be
sad to leave it behind. Exactly because it's _so_ little effort to
just keep.

Now, some of the other filesystems have gotten much more work done to
them - but it's because people have actively worked on them. rmk
actually did several adfs patch-series of cleanups etc back in 2019,
for example. Other than that, adfs seems to actually have gotten less
attention than sysvfs did, but I think that is probably because it
lacked the "Al Viro likes it" factor.

And something like befs - which has no knight in shining armor that
cares at all - has just a very small handful of one-liner patches for
VFS API changes.

So even the completely unloved ones just aren't a *burden*.

Reiserfs does stand out, as you say. There's a fair amount of actual
bug fixes and stuff there, because it's much more complicated, and
there were presumably a lot more complicated uses of it too due to the
history of it being an actual default distro filesystem for a while.

And that's kind of the other side of the picture: usage matters.
Something like affs or minixfs might still have a couple of users, but
those uses would basically be people who likely use Linux to interact
with some legacy machine they maintain..  So the usage they see would
mainly be very simple operations.

And that matters for two reasons:

 (a) we probably don't have to worry about bugs - security or
otherwise - as much. These are not generally "general-purpose"
filesystems. They are used for data transfer etc.

 (b) if they ever turn painful, we might be able to limit the pain further.

For example, mmap() is a very important operation in the general case,
and it actually causes a lot of potential problems from a filesystem
standpoint. It's one of the main sources of what little complexity
there is in the buffer head handling, for example.

But mmap() is *not* important for a filesystem that is used just for
data transport. I bet that FAT is still widely used, for example, and
while exFAT is probably making inroads, I suspect most of us have used
a USB stick with a FAT filesystem on it in the not too distant past.
Yet I doubt we'd have ever even noticed if 'mmap' didn't work on FAT.
Because all you really want for data transport is basic read/write
support.

And the reason I mention mmap is that it actually has some complexity
associated with it. If you support mmap, you have to have a read_folio
function, which in turn is why we have mpage_readpage(), which in turn
ends up being a noticeable part of the buffer cache code - any minor
complexity of the buffer cache does not tend to be about the
individual bh's themselves, but about the 'b_this_page' traversal, and
how buffers can be reached not just with sb_bread() and friends, but
are reachable from the VM through the page they are in.

IOW, *if* the buffer cache ever ends up being a big pain point, I
suspect that we'd still not want to remove ir, but it might be that we
could go "Hmm. Let's remove all the mmap support for the filesystems
that still use the buffer cache for data pages, because that causes
problems".

I think, for example, that ext4 - which obviously needs to continue to
support mmap, and which does use buffer heads in other parts - does
*not* use the buffer cache for actual data pages, only for metadata. I
might be wrong.

Anyway, based on the *current* situation, I don't actually see the
buffer cache even _remotely_ painful enough that we'd do even that
thing. It's not a small undertaking to get rid of the whole
b_this_page stuff and the complexity that comes from the page being
reachable through the VM layer (ie writepages etc). So it would be a
*lot* more work to rip that code out than it is to just support it.

         Linus

