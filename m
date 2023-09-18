Return-Path: <ksummit+bounces-1151-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2987A55E8
	for <lists@lfdr.de>; Tue, 19 Sep 2023 00:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBCCD1C20B93
	for <lists@lfdr.de>; Mon, 18 Sep 2023 22:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E802AB23;
	Mon, 18 Sep 2023 22:48:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00196286B1
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 22:48:44 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso8151970e87.0
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695077323; x=1695682123; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i6hkJxO6NTkRAR4iA2oDJjG8smKCtYLtHbMWyNh04yg=;
        b=CpeeGvkbZlbWrbda4JMMS341JTXASiyAHqaCpoWaWkTpGCZp59CVczFju5zCCSeIa2
         GTbGP0RxPg5WQ+l0IQw9RvUG13g/QF7nJ/MaMSjcftcYr+geWuB8uu9Zo4PMWmE8/0Xh
         p4TQZxQiVtjIn0C5MhXNFePUHUxNipVttMm28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695077323; x=1695682123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6hkJxO6NTkRAR4iA2oDJjG8smKCtYLtHbMWyNh04yg=;
        b=Cpz38a1uCMrvfnnFCrsVWNscw8bdluh5KSeibjq7IMFQwCGU19zWtql32uqFojCYVd
         O5r4kF3zpKnV3rtTXu75rwO/wxm+wpCxChU2+woGDphaF9XzIjR4GFDu+9l7F4QLsh9X
         JJ55b5PCrtlrIW4cmOsJhOLTZqzcVinvJ/S+JmfsVOa2UU5Y8bnbe2k5nUsOe+5h8NdH
         oy8t1fFMDh6i22Ja2KPIHwI/91jThvQfPbKZp/wrbtXzEwov9DQzrFhIQ3VIjZBs8itg
         KSlb60d15uR++QHvCzTpjNdVkwAlnp45WovGbNKXemFjzvEqKNt/9L+Y9QZhLa0k7J2Z
         /7zQ==
X-Gm-Message-State: AOJu0YzVyYI1cor93lyhjFuGDgJw5S+gqhQx67m6ggJhcs4pmmzc9Cna
	7RBijttYtmsXA8W2t7akOxBJ2SwWOuTj9bf6h4eOe6Dx
X-Google-Smtp-Source: AGHT+IERjo5WX4OdkVYsRjyGApbPGpdTpBspXwFoDBahqvfz6LBnsRpm27VoJykdaEYr/l3T23PTyA==
X-Received: by 2002:a05:6512:110d:b0:503:17e1:a05a with SMTP id l13-20020a056512110d00b0050317e1a05amr3912092lfg.30.1695077322714;
        Mon, 18 Sep 2023 15:48:42 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id s15-20020a056402014f00b0052ffc2e82f1sm6624658edu.4.2023.09.18.15.48.41
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 15:48:41 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so6330439a12.1
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 15:48:41 -0700 (PDT)
X-Received: by 2002:a05:6402:4c4:b0:525:76fc:f559 with SMTP id
 n4-20020a05640204c400b0052576fcf559mr8082482edw.41.1695077320907; Mon, 18 Sep
 2023 15:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu> <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
 <20230918111402.7mx3wiecqt5axvs5@quack3> <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
 <nycvar.YFH.7.76.2309182127480.14216@cbobk.fhfr.pm> <CAHk-=whoKiqEThggu_HA5VA9wXPTBxdUBdkt+n_rNu8XaFy1oA@mail.gmail.com>
 <ZQi4E_3b6MrJQSXs@mit.edu>
In-Reply-To: <ZQi4E_3b6MrJQSXs@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Sep 2023 15:48:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizOtVCZCcUvC3F+GFxcTfj1D3qL2yzCfd7YRnntY0=pQ@mail.gmail.com>
Message-ID: <CAHk-=wizOtVCZCcUvC3F+GFxcTfj1D3qL2yzCfd7YRnntY0=pQ@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Jiri Kosina <jikos@kernel.org>, Jan Kara <jack@suse.cz>, NeilBrown <neilb@suse.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Chinner <david@fromorbit.com>, 
	Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Sept 2023 at 13:51, Theodore Ts'o <tytso@mit.edu> wrote:
>
> Fortunately, I most of the "simple" file systems appear to support
> mmap, via generic_file_mmap:

Yes, but that is in fact exactly the path that causes the most
complexity for the buffer cache: it needs that "readpage" function
that in turn then uses mpage_readpage() and friends to create the
buffers all in the same page.

And then - in order for normal read/write to not have any buffer
aliases, and be coherent - they too need to deal with that "group of
buffers in the same page" situation too.

It's not a *big* amount of complexity, but it's absolutely the most
complicated part of the buffer cache by far, in how it makes buffer
heads not independent of each other, and how it makes some of the
buffer cache depend on the page lock etc.

So the mmap side is what ties buffers heads together with the pages
(now folios), and it's not pretty. we have a number of loops like

        struct buffer_head *bh = head;
        do {
                .. work on bh ..
                bh = bh->b_this_page;
        } while (bh != head);

together with rules for marking buffers and pages dirty / uptodate /
whatever hand-in-hand.

Anyway, all of this is very old, and all of it is quite stable. We had
mmap support thanks to these games even before the page cache existed.

So it's not _pretty_, but it works, and if we can't just say "we don't
need to support mmap", we're almost certainly stuck with it (at least
if we want mappings that stay coherent with IO).

               Linus

