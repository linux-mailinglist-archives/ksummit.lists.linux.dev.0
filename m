Return-Path: <ksummit+bounces-1113-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275D799D5F
	for <lists@lfdr.de>; Sun, 10 Sep 2023 10:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E73E1C20932
	for <lists@lfdr.de>; Sun, 10 Sep 2023 08:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2238C23A1;
	Sun, 10 Sep 2023 08:37:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB269A49
	for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 08:37:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A46055C00AE;
	Sun, 10 Sep 2023 04:37:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 10 Sep 2023 04:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1694335054; x=1694421454; bh=RrjLsQMKk2Iod7XUPa01kHWaj4owCGnkCDS
	YwHgdFCI=; b=ime5uwrouaVU46IHB9FeioW0C5l5N5Ffm+WTP46TlJLQ9S1BM3f
	EGsmbJlmer6tL7/eptnKMag00FZ0kJiaDhxjO9VitX/ct6sZtEQps2dL1L03tqAE
	8xILfWkjYcmjdLfebIexU2+1iQj+qE8QpVlmSkQ7f+rmZ78RDyRIkSVQVk8ZE1Kg
	uQjwHslblCL73VsGk5HDu2/0gibxSOjjF7p7Mdqt6vnrYe48aLKE1om16nri9lLv
	ooofrWNtuZKOET+fO3+02Xvk4VonN/I0GsjOQo+RrL/fPtsRJYcvf5HsssbczDT2
	T+igtPMXhgfxurglIhW+osehKjyVstUEvKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1694335054; x=1694421454; bh=RrjLsQMKk2Iod7XUPa01kHWaj4owCGnkCDS
	YwHgdFCI=; b=2Z274tkYBZc8ln4P/Lf71q1C6zfJi02SrXTj7BVM2t6JRwVNMpR
	QABlgexE0VzUL1PKQe3erxMFCKFRP1Ip8OTOg6B1Zhm1ydvKX6zguQEpj7vh9HZ8
	kSOAA9knGReyciDYPn6b6lkUD4TwcakwbtQV2g5QO7NW66togPxDxB9C5ElgkoAz
	8283nZxN9SQhhDVKwPWYLCZVWz7HTczg3/ux25R24ntxrFjJpkzZ33xgt8q4iCBa
	0yanO3dAYLgub6mFZAOO2IvOI3xp2Cl2pZyTH4nhMwq3KjADMFoMfM/BWEIHSat5
	Cpn27aHU4hvNV7B2+1Cm+mCRJFWIYo+BxDQ==
X-ME-Sender: <xms:ToD9ZHX6DOdt7lLIHNoNuF1xTlB-ZJs1MmM_B4syuRS-92Pn1E_cFg>
    <xme:ToD9ZPndXasnEVQDjGky03CwqyHgqOCRQFOi5VdCFh1q1_45qoFTicMpUm50P6ajF
    5bMDGuqSqgYYszG>
X-ME-Received: <xmr:ToD9ZDaRUdNd5EfYgdV2JXq7N1WZFAB-gXueCcFRNe_WCRMSir4pIbDV2Wk9603G4hWb8rM7ybqxzvhouitFkoYxE1A0OeIzUiK2G8AlxKeCX1k_pubM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeivddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeeuvghr
    nhguucfutghhuhgsvghrthcuoegsvghrnhgurdhstghhuhgsvghrthesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhephfejueefueeivdehhfekteekvddvjefffeeg
    leetgfdufedvfeefvefhveefvedunecuffhomhgrihhnpeigkhgtugdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvghrnhgurdhs
    tghhuhgsvghrthesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:ToD9ZCXE3DgWoiETl9xPx-JRYA7ZmsjqsVGHLPu8f91jyC_949O_aA>
    <xmx:ToD9ZBmGmLI9JX7P6kwBsbu5BbZSLUTpK7JDkuiJaNA2hKZpaboe9w>
    <xmx:ToD9ZPcqXuE78jqivHJT2RbBPGlOA5koTnZAQsVZqSP8mLHK_DEcpA>
    <xmx:ToD9ZPbmscw3HIUeE09NHKKscLz4fMOms5_VBlUsHkAI02igWLYVxA>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Sep 2023 04:37:32 -0400 (EDT)
Message-ID: <20289a09-4052-155b-3dca-eff297964fc3@fastmail.fm>
Date: Sun, 10 Sep 2023 10:37:30 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Matthew Wilcox <willy@infradead.org>, Dave Chinner <david@fromorbit.com>,
 Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Bernd Schubert <bernd.schubert@fastmail.fm>
In-Reply-To: <CAMuHMdW3waT489ZyUPn-Qp_Nvq_E-N0uimV=iw5Nex+=Tc++xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/10/23 10:19, Geert Uytterhoeven wrote:
> Hi Kent,
> 
> On Sun, Sep 10, 2023 at 12:42 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
>> On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
>>> So why can't we figure out that easier way? What's wrong with trying to
>>> figure out if we can do some sort of helper or library set that assists
>>> supporting and porting older filesystems. If we can do that it will not
>>> only make the job of an old fs maintainer a lot easier, but it might
>>> just provide the stepping stones we need to encourage more people climb
>>> up into the modern VFS world.
>>
>> What if we could run our existing filesystem code in userspace?
>>
>> bcachefs has a shim layer (like xfs, but more extensive) to run nearly
>> the entire filesystem - about 90% by loc - in userspace.
>>
>> Right now this is used for e.g. userspace fsck, but one of my goals is
>> to have the entire filesystem available as a FUSE filesystem. I'd been
>> planning on doing the fuse port as a straight fuse implementation, but
>> OTOH if we attempted a sh vfs iops/aops/etc. -> fuse shim, then we would
>> have pretty much everything we need to run any existing fs (e.g.
>> reiserfs) as a fuse filesystem.
>>
>> It'd be a nontrivial project with some open questions (e.g. do we have
>> to lift all of bufferheads to userspace?) but it seems worth
>> investigating.
> 
>    1. https://xkcd.com/1200/ (not an exact match, but you should get the idea),
>    2. Once a file system is removed from the kernel, would the user space
>       implementation be maintained better?

Unlikely that it would be maintained any better, more the other way around.
But then, effects on the entire system wouldn't be that severe anymore.
Moving deprecated file systems to fuse had been a short discussion
at LSFMM.




