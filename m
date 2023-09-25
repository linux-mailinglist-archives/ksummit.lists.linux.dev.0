Return-Path: <ksummit+bounces-1187-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFD7AD4C2
	for <lists@lfdr.de>; Mon, 25 Sep 2023 11:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1F62E281ACE
	for <lists@lfdr.de>; Mon, 25 Sep 2023 09:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBBD13FFB;
	Mon, 25 Sep 2023 09:43:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F34320D
	for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RvJ6btVstunC4sS1SymReLeaSFeBaYeiuoBVBLuk0CA=; b=NaOM2H+2F/cWm6Ly14gVW8af3u
	y3rCqBvJShGZGeansx9fkozSzg8mmHORIXn+EoL7Za3Gz1AwjYbG9fgGTuzSDUiywY8qjobseF/ad
	2zMeGbiSWJdcPF2z/lZmspLytUGn/oHP+RS0cZX7B8/QByMyUPl/11UeqHQIBa90xi92Um3GzXFnC
	LUFd5V4+L0Zx2yLdMLqFZ4Vv+evlXlNiissEIOoLwQHFJWegVN6lEwSuk378lDb/0YzMKDmCcrQnB
	YnUeK7NgxUoiwH3qWT5ENn2WluVyP/g5fwBGSsCvNXks6TnBgjzraYzQKjg3pUlg1lDlMIx9NsKZw
	1ysZ5BNw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qki7q-00Dsq8-1x;
	Mon, 25 Sep 2023 09:43:34 +0000
Date: Mon, 25 Sep 2023 02:43:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Kara <jack@suse.cz>,
	Theodore Ts'o <tytso@mit.edu>, NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZRFWRm1L0Ridyfy8@infradead.org>
References: <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu>
 <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
 <20230918111402.7mx3wiecqt5axvs5@quack3>
 <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
 <ZQkqDZF9GPbrHDax@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQkqDZF9GPbrHDax@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 19, 2023 at 02:56:45PM +1000, Dave Chinner wrote:
> That's the best argument for removing all these old filesystems from
> the kernel that anyone has made so far.
> 
> As it is, I'm really failing to see how it can be argued
> successfully that we can remove ia64 support because it has no users
> and is a maintenance burden on kernel developers, but that same
> argument doesn't appear to hold any weight when applied to a
> filesystem.
> 
> What makes filesystems so special we can't end-of-life them like
> other kernel code?

Yepp.  And I don't want to remove them against major objections.  If
we even have a single user that actually signs up to do basic QA
I think it's fair game to keep it.  Similar to how we deal with most
drivers (except for some subsystems like net that seemed to be a lot
more aggressive in their removal schedules).


