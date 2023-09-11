Return-Path: <ksummit+bounces-1127-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFC79AB07
	for <lists@lfdr.de>; Mon, 11 Sep 2023 21:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 109491C20959
	for <lists@lfdr.de>; Mon, 11 Sep 2023 19:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7038015ACC;
	Mon, 11 Sep 2023 19:11:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84422156DB
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 19:11:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A275121863;
	Mon, 11 Sep 2023 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694459466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd1GXArbDlH//JD9QgDmADD7DMHkLitKJX8xJ6rAvJg=;
	b=W2cv0Xz9qzM7XTQweMGsyPuzuUGv6tsBtxRA1eHgrynyRUI1CdLxJ5zlQP7nbt3I6psUAD
	Pv0vLeipRPIc7jLcU7Xd6tu3ncPGFuWN3ug+cRfqdyz0TAuu3ckG4qrWS3lB20qWPX7fnB
	nPwjJWixepZ1RfIGBfTgwzLMG8f89/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694459466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd1GXArbDlH//JD9QgDmADD7DMHkLitKJX8xJ6rAvJg=;
	b=kIDhiR96Wc2/sKwMM361W4cDDn46R/qoZ6di4YLALJX4rjz0S5i39D5bgiT3eVjrXzLr+5
	VKrNmS9udY5Oo1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53B68139CC;
	Mon, 11 Sep 2023 19:11:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lnDgEkpm/2R1UwAAMHmgww
	(envelope-from <ddiss@suse.de>); Mon, 11 Sep 2023 19:11:06 +0000
Date: Mon, 11 Sep 2023 21:11:05 +0200
From: David Disseldorp <ddiss@suse.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Dave Chinner <david@fromorbit.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Matthew Wilcox
 <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org, Hajime Tazaki
 <thehajime@gmail.com>, Octavian Purdila <tavi.purdila@gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230911211105.1050fb2c@echidna.fritz.box>
In-Reply-To: <3c66d844-67e5-82d2-6d14-9f6c6b6fcc36@acm.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<ZPe0bSW10Gj7rvAW@dread.disaster.area>
	<ZPe4aqbEuQ7xxJnj@casper.infradead.org>
	<8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
	<20230909224230.3hm4rqln33qspmma@moria.home.lan>
	<ZP5nxdbazqirMKAA@dread.disaster.area>
	<20230911012914.xoeowcbruxxonw7u@moria.home.lan>
	<ZP52S8jPsNt0IvQE@dread.disaster.area>
	<20230911153515.2a256856@echidna.fritz.box>
	<3c66d844-67e5-82d2-6d14-9f6c6b6fcc36@acm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Sep 2023 10:45:31 -0700, Bart Van Assche wrote:

> On 9/11/23 06:35, David Disseldorp wrote:
> > The LKL block layer may also become useful for legacy storage support in
> > future, e.g. SCSI protocol obsolescence.  
> 
> There are probably more Linux devices using SCSI than NVMe. There are 
> several billion Android phones in use. Modern Android phones use UFS 
> storage. UFS is based on SCSI. There are already UFS devices available 
> that support more than 300K IOPS and there are plans for improving 
> performance further. Moving the SCSI stack to user space would have a
> very significant negative performance impact on Android devices.

I could imagine cases where support for SBC <= X and SPC <= Y is
deprecated or removed. SG_IO would probably be more applicable for
legacy device support in user-space, but I think it still serves as a
reasonable example for how LKL could also be useful.

Cheers, David

