Return-Path: <ksummit+bounces-1148-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 886707A5372
	for <lists@lfdr.de>; Mon, 18 Sep 2023 21:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24541C20F9C
	for <lists@lfdr.de>; Mon, 18 Sep 2023 19:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7915327EF3;
	Mon, 18 Sep 2023 19:59:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAF27EED
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 19:59:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-502153ae36cso7904698e87.3
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695067175; x=1695671975; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IfqbVkGHBoZGHryAINIdEudRrkAyBzkbimgGl4E0yt8=;
        b=cncbjGFl2rLoHeUnqyNOrngMQuGCrqFsi1maVBXdDwERSwAL4Ad3wK/6wloJVBPzKz
         eSAchNNnqEo/vetW3397xVyfeBUNDGUiUcnaztVg/ZKKWgAAXD4x9WvWRwbyl0udACYa
         UUdGF4IxHUiMXEmpMZhHZhNReMjG0uqXgP1AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695067175; x=1695671975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfqbVkGHBoZGHryAINIdEudRrkAyBzkbimgGl4E0yt8=;
        b=bf6V8MixjqC8xlqVdhgM8uPfnjlWIP2x7+CicwJuB4/UDqMnTNC5bz4cQQPdJYGrEP
         7c6FJ6SvbzCkOLfG5deJW35ZP4G5hecMaSNoFQ68pOa44cUt9nH7xfUZFHO+InLSZUlw
         jY1LsGqqKCfu14+r57kb37WqauKR7XWujkIXMo0r3LQ5JUqjvhhhcCn7jx1Md/EgwJA7
         SBCdAcZ1T1CVOpyF24HbgkwK3xCrKHWnK5TfN2D+jTI2qL+nhjK2RlqQo6vwJHRcoYQz
         zOifR9OfBfIfUjeKQND437uPAAkHWj8N2aDEoYt0wWw8jMMoteYTPy5aro9Ej4B4mPdT
         7L1Q==
X-Gm-Message-State: AOJu0Yzypvx4tY2bTWj96tfy7eB0Y2f8r1gBfBesNy9M/hJDy0sPbFVI
	YZ41vYYPvKehWzojAYgrm4a7CrptkWK4+8SPW6WvxHZk
X-Google-Smtp-Source: AGHT+IFD3aTUV4TuAhKMj0RaJY2rzVT/WK5x5gRc2dZ3aslrsjd0bQZG2TojxzVoqkXwC3CbZQMKmw==
X-Received: by 2002:a05:6512:2393:b0:502:fd08:69f7 with SMTP id c19-20020a056512239300b00502fd0869f7mr9092311lfv.28.1695067175047;
        Mon, 18 Sep 2023 12:59:35 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004ff8631d6c0sm1941069lfn.278.2023.09.18.12.59.33
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 12:59:34 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso7943240e87.0
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 12:59:33 -0700 (PDT)
X-Received: by 2002:a19:8c0b:0:b0:503:99d:5a97 with SMTP id
 o11-20020a198c0b000000b00503099d5a97mr4098028lfd.20.1695067173515; Mon, 18
 Sep 2023 12:59:33 -0700 (PDT)
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
 <20230918111402.7mx3wiecqt5axvs5@quack3> <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
 <nycvar.YFH.7.76.2309182127480.14216@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2309182127480.14216@cbobk.fhfr.pm>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Sep 2023 12:59:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whoKiqEThggu_HA5VA9wXPTBxdUBdkt+n_rNu8XaFy1oA@mail.gmail.com>
Message-ID: <CAHk-=whoKiqEThggu_HA5VA9wXPTBxdUBdkt+n_rNu8XaFy1oA@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Jiri Kosina <jikos@kernel.org>
Cc: Jan Kara <jack@suse.cz>, "Theodore Ts'o" <tytso@mit.edu>, NeilBrown <neilb@suse.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Chinner <david@fromorbit.com>, 
	Eric Sandeen <sandeen@sandeen.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Sept 2023 at 12:32, Jiri Kosina <jikos@kernel.org> wrote:
>
> I am afraid this is not reflecting reality.
>
> I am pretty sure that "give me that document on a USB stick, and I'll take
> a look" leads to using things like libreoffice (or any other editor liked
> by general public) to open the file directly on the FAT USB stick. And
> that's pretty much guaranteed to use mmap().

Ugh. I would have hoped that anybody will fall back to read/write -
because we definitely have filesystems that don't support mmap.

But I guess they are so specialized as to not ever trigger that kind
of problem (eg /proc - nobody is putting office documents there ;)

A cache-incoherent MAP_PRIVATE only mmap (ie one that doesn't react to
'write()' changing the data) is easy to do, but yeah, it would still
be a lot more work than just "keep things as-is".

           Linus

