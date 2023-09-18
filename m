Return-Path: <ksummit+bounces-1147-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7987A5322
	for <lists@lfdr.de>; Mon, 18 Sep 2023 21:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA4E281E59
	for <lists@lfdr.de>; Mon, 18 Sep 2023 19:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A375427735;
	Mon, 18 Sep 2023 19:32:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CC1F5E8
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 19:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864D0C433C7;
	Mon, 18 Sep 2023 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695065530;
	bh=fgoIlk2owzQ8mKC78potAed7ErOYTJkJDsj1NPK+RKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cp/+73do1FjeYXRL775Cfa0+aQWYlIbQFf1HwMph08nVFgbGfVy6uvRxWj6BqNJRZ
	 PSfLLQd9hxCrf4O5d5LZ75n8kqm/9Syb1orHlHFiMmLuKuS+HHB+7UOU7SDvxUBYXI
	 KLiEfAmNoypZjH7BzJ5DdHz1ibFMWAeJyW2WdujnKJpNWYJjcPLcrvXzJKnf2kKEgS
	 0QFlLhZEf601CsUyxZ/RBnn4TcxBLXg20zzgRa9i9YGskgO8p09qJYme8csGdE/2/h
	 hEgfzCyTGI1juL5Q7JhnZH3iGh8c7ZzIWoiqRbHMz6IZBGOpNFlivS1EZoAZY+cLcW
	 qhKbQuBonycDw==
Date: Mon, 18 Sep 2023 21:32:05 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>, 
    NeilBrown <neilb@suse.de>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>, 
    Steven Rostedt <rostedt@goodmis.org>, Guenter Roeck <linux@roeck-us.net>, 
    Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
    linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
In-Reply-To: <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2309182127480.14216@cbobk.fhfr.pm>
References: <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home> <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com> <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com> <169491481677.8274.17867378561711132366@noble.neil.brown.name> <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com> <20230917185742.GA19642@mit.edu>
 <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com> <20230918111402.7mx3wiecqt5axvs5@quack3> <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Sep 2023, Linus Torvalds wrote:

> But mmap() is *not* important for a filesystem that is used just for 
> data transport. I bet that FAT is still widely used, for example, and 
> while exFAT is probably making inroads, I suspect most of us have used a 
> USB stick with a FAT filesystem on it in the not too distant past. Yet I 
> doubt we'd have ever even noticed if 'mmap' didn't work on FAT. Because 
> all you really want for data transport is basic read/write support.

I am afraid this is not reflecting reality.

I am pretty sure that "give me that document on a USB stick, and I'll take 
a look" leads to using things like libreoffice (or any other editor liked 
by general public) to open the file directly on the FAT USB stick. And 
that's pretty much guaranteed to use mmap().

-- 
Jiri Kosina
SUSE Labs


