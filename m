Return-Path: <ksummit+bounces-1143-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27967A3921
	for <lists@lfdr.de>; Sun, 17 Sep 2023 21:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF071C20C2F
	for <lists@lfdr.de>; Sun, 17 Sep 2023 19:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC8D6FDB;
	Sun, 17 Sep 2023 19:45:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C626FC9
	for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 19:45:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-530e180ffcbso1000377a12.1
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694979949; x=1695584749; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwXgrTVODP9hO74p2+wYHWUrKTpTeCxYeIBxqntxU2Y=;
        b=MtUqF8xhCDty3ejAo00GqrIi45cTLgQmBisAXmuNIqjd9etVXyeDE2td+1P44r+dox
         lfKZIQj31uJbG14wd0KgiMnDb3Kf7ksq1VIqBY1McxdZwX/N9Wyge0uddwWAPnxSh705
         Yi8VsLNUezNeIpMSBaayCj6UtRnuqc0gVg21c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694979949; x=1695584749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwXgrTVODP9hO74p2+wYHWUrKTpTeCxYeIBxqntxU2Y=;
        b=BPxSAgPpLl7ntqBdaj97aJJQ0jz2bv8tkv9Gi4+J0er6p4Mzz+WeXIkbTWL9pMxVuC
         JPVhbOpOZBOTgAaAxivuI/2+WC7kNtpQEOXNTS/MB1GdGKpjA//mTvpYwRkPMo1Xg/6S
         zgFmfP1LweK+ZJ0hBmIxWnOcmtMbXZ9KprbYvaxgnIq0CoT0HGbO0bDCE0Qw9LX9jnZE
         B1ufkExorPlBPOSADQkFWOWb6FI/AbGtDgcoqzZ3d38fHvmtaqUaFP3P5lixMMo1JR7v
         mIl3gS7SqsmNF8oUD6F+Lk6JkHanEYo/Es8HKqkTMxXCmkLuCAOW1ZT81JsmGX7UyC6D
         INLg==
X-Gm-Message-State: AOJu0YyWwN394k9mekJLCHYU/pz5TLstL2sGZhY7NrgAjd8W4xR+KgG0
	9DYjyDVTVZNPIzDzVe3mNmuvOZNhsUpML15TxifGE04t
X-Google-Smtp-Source: AGHT+IERPm1kLsbZccDmJH/OcLnBVpTDQsZnA7CBXfyJxoqH48mGPRZIro1OsJgpIreV8jLy1//8uw==
X-Received: by 2002:a50:ee84:0:b0:523:38ea:48bb with SMTP id f4-20020a50ee84000000b0052338ea48bbmr6538158edr.24.1694979949229;
        Sun, 17 Sep 2023 12:45:49 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id k7-20020aa7c047000000b0052febc781bfsm5042741edo.36.2023.09.17.12.45.48
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 12:45:48 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401da71b85eso42278675e9.1
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 12:45:48 -0700 (PDT)
X-Received: by 2002:a5d:5a1d:0:b0:321:4c7e:45e3 with SMTP id
 bq29-20020a5d5a1d000000b003214c7e45e3mr1311472wrb.11.1694979948004; Sun, 17
 Sep 2023 12:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPkz86RRLaYOkmx+@dread.disaster.area> <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com> <20230917185742.GA19642@mit.edu>
In-Reply-To: <20230917185742.GA19642@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Sep 2023 12:45:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
Message-ID: <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: NeilBrown <neilb@suse.de>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>, 
	Steven Rostedt <rostedt@goodmis.org>, Guenter Roeck <linux@roeck-us.net>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Sept 2023 at 11:58, Theodore Ts'o <tytso@mit.edu> wrote:
>
> Ext4 uses buffer_heads, and wasn't on your list because we don't use
> sb_bread().

Heh. Look closer at my list. ext4 actually was on my list, and it
turns out that's just because 'sb_bread()' is still mentioned in a
comment.

I did say that my list wasn't really the result of any exhaustive
analysis, but I picked up ext4 by luck.

And yes, ext4 was also one of the reasons I then mentioned that within
the contexts of individual filesystems, it may make sense to deprecate
the use of buffer heads.

Because yes, buffer heads _are_ old and overly simplistic. And I don't
really disagree with people who don't want to extend on them any more.
There are better models.

I think buffer heads are great for one thing, and really one thing
only: legacy use cases.

So I don't think it should be a shock to anybody that most of the
listed filesystems are random old legacy cases (or related to such -
exfat).

But "old" does not mean "bad". And legacy in many ways is worth
cherishing. It needs to become a whole lot more painful than buffer
heads have ever been to be a real issue.

It is in fact somewhat telling that of that list of odds and ends
there was *one* filesystem that was mentioned in this thread that is
actively being deprecated (and happens to use buffer heads).

And that filesystem has been explicitly not maintained, and is being
deprecated partly exactly because it is the opposite of cherished. So
the pain isn't worth it.

All largely for some rather obvious non-technical reasons.

So while reiserfs was mentioned as some kind of "good model for
deprecation", let's be *real* here. The reason nobody wants to have
anything to do with reiserfs is that Hans Reiser murdered his wife.

And I really *really* hope nobody takes that to heart as a good model
for filesystem deprecation.

                Linus

