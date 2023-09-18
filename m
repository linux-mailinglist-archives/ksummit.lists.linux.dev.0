Return-Path: <ksummit+bounces-1144-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236E7A4828
	for <lists@lfdr.de>; Mon, 18 Sep 2023 13:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD92A281450
	for <lists@lfdr.de>; Mon, 18 Sep 2023 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DEC171BF;
	Mon, 18 Sep 2023 11:14:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C2538F8C
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 11:14:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D8F321AC4;
	Mon, 18 Sep 2023 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695035643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9wyqH1F/2/n6Rtd1BUDGd406KJF18dOSgJVVSYH5jL8=;
	b=j23Q6EQBDHxeKlYoVObQqeZfEcr/trqnUvqDGc2U97JjSRUdIsa00qmJBbOdiFqRjxe7hQ
	VHDBc8GzO8C2Zzc7/w00MnxM5/nvCdAUhNax+eBTzAs4yFC2QM+UfyLnBFKcqrD4+6XEbw
	KElBC7HtERlP59PkL6cnSUdzgZ3q8vA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695035643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9wyqH1F/2/n6Rtd1BUDGd406KJF18dOSgJVVSYH5jL8=;
	b=cEKgzGibOT5QdVV8O3XdgL60epCbfUvV52eo9L6SME244rkN023X57wIE91XLV8+PUjnUX
	4FrnfCeMBVGnKTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30E2C13480;
	Mon, 18 Sep 2023 11:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mMrmC/swCGUCUAAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 18 Sep 2023 11:14:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id B8BE8A0759; Mon, 18 Sep 2023 13:14:02 +0200 (CEST)
Date: Mon, 18 Sep 2023 13:14:02 +0200
From: Jan Kara <jack@suse.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>, NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Chinner <david@fromorbit.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230918111402.7mx3wiecqt5axvs5@quack3>
References: <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu>
 <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>

On Sun 17-09-23 12:45:30, Linus Torvalds wrote:
> Because yes, buffer heads _are_ old and overly simplistic. And I don't
> really disagree with people who don't want to extend on them any more.
> There are better models.
> 
> I think buffer heads are great for one thing, and really one thing
> only: legacy use cases.
> 
> So I don't think it should be a shock to anybody that most of the
> listed filesystems are random old legacy cases (or related to such -
> exfat).
> 
> But "old" does not mean "bad". And legacy in many ways is worth
> cherishing. It needs to become a whole lot more painful than buffer
> heads have ever been to be a real issue.

I agree. On the other hand each filesystem we carry imposes some
maintenance burden (due to tree wide changes that are happening) and the
question I have for some of them is: Do these filesystems actually bring
any value? I.e., are there still any users left? Sadly that's quite
difficult to answer so people do bother only if the pain is significant
enough like in the case of reiserfs. But I suspect we could get rid of a
few more without a real user complaining (e.g. Shaggy said he'd be happy to
deprecate JFS and he's not aware of any users).

> It is in fact somewhat telling that of that list of odds and ends
> there was *one* filesystem that was mentioned in this thread that is
> actively being deprecated (and happens to use buffer heads).
> 
> And that filesystem has been explicitly not maintained, and is being
> deprecated partly exactly because it is the opposite of cherished. So
> the pain isn't worth it.
> 
> All largely for some rather obvious non-technical reasons.
> 
> So while reiserfs was mentioned as some kind of "good model for
> deprecation", let's be *real* here. The reason nobody wants to have
> anything to do with reiserfs is that Hans Reiser murdered his wife.

Well, I agree that's (consciously or unconsciously) the non-technical part
of the reason. But there's also a technical one. Since Hans' vision how
things should be didn't always match how the rest of the VFS was designed,
reiserfs has accumulated quite some special behavior which is very easy to
break. And because reiserfs testing is non-existent, entrusting your data
to reiserfs is more and more a Russian roulette kind of gamble. So the two
existing reiserfs users that contacted me after announcing reiserfs
deprecation both rather opted for migrating to some other filesystem.
 
> And I really *really* hope nobody takes that to heart as a good model
> for filesystem deprecation.

LOL :).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

