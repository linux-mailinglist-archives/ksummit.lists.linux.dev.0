Return-Path: <ksummit+bounces-1255-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC7907844
	for <lists@lfdr.de>; Thu, 13 Jun 2024 18:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 527F9283325
	for <lists@lfdr.de>; Thu, 13 Jun 2024 16:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13FE146A71;
	Thu, 13 Jun 2024 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="m1eQP0Ni";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lxH0FuEw"
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74F12D757
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296070; cv=none; b=BsSsmujPwrO3z08S13K+GiVVXn/x640JSR1G9gWFFa0zjUTxBnuBOgtN2/AaUk3jnoMJ8EmR27phW4IbOuCWsPErRe/e1JUZTQEQDIPJoc6+Nv3d53JjWx/Xo4XabVCYuTbhuBGxsSdiWRU5nGfPMtdqg45AodrXPbHKDtBv7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296070; c=relaxed/simple;
	bh=Olr9KAu54+mvZmCQPuMJyfDWqrfedwAs78viR7I/0qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrDGtIIBpGfeakM/oIA6qtr8zm0pFmCoCcNUn6dH40Dbn7ITRfjizs4TNorQTYIEip8HM5Oa5QWpwuIAMLw8WW9Moug3P4gHqK6n/1UdZl9AVCqbSF3ROk0JMkap8tOCihsp4hF3GCBv3lAC1zAXwHv9wAbrgqJGA1F73qgTrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=m1eQP0Ni; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lxH0FuEw; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 013511C000B3;
	Thu, 13 Jun 2024 12:27:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 13 Jun 2024 12:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718296066;
	 x=1718382466; bh=JWZNk/OAveQTCySsyGCzZUUaVHrGOtsTLVb/xPugwko=; b=
	m1eQP0NixPlNMOHPSWt+nCT9136zvoJ9EM/InMqxiVXKGsJYZ+ATqYIJpAs/I5hx
	T5gd98FXMmgzBvAHHGzGLce4CQOzdquCYn4zDtaY5luNwpfbD/P+HjuQmFSL+APZ
	PgYg3iBQIzKCZ05oHTd6tqBGzL4o5XmU2qJWDaY50i7PxX/u92KJ1Zf5VLC1/wgi
	+TV56rG2lTzzKdgb8eEVM83TSy0hua7V7+3nFLpwd0jmCDUtXYMXr0VA61gy9Xic
	jvsAO9L4XfPcFg9tI7QyHrjNKTrTxK1ZmR+p0rKzK9kvH5w23eYx9tbmvn+RdWJo
	1trraUxgmuVJCcR5bQhQVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718296066; x=
	1718382466; bh=JWZNk/OAveQTCySsyGCzZUUaVHrGOtsTLVb/xPugwko=; b=l
	xH0FuEws6DQiW8WlO67Xuivacc7yYwtWBaGWNHgHAaX595kbqHYvjvNlI8kRG/Wa
	dF/gykywj6D3fctTc+DY2Ba2OtPvMftFtW+toy6vs8FRgMFdQ/eyZnUZuOI9MdKm
	UjDYGhGoO0e7CRYaotGfeqN7JSKaFoP7susZe8HkfASzsElKDjrrIfZM4UUqiR+K
	1nFcAugWtyRYPtoD72Wh7Iu5yvZyEriaShE4ETqZ5Wpo0b28Va75E4dsZfrT5FZA
	Tx/Olu0YTGUDWIq9LRZ9R+Pos3dyOIWD52I30RMD5lCSbeRMOeD47fsPPwlCgyXA
	usjlowddXf/RGD9mWlwWQ==
X-ME-Sender: <xms:Ah5rZo4lcAIt83pRfVh65zOIzwARMXvalWjIshtkWZ6PTMzlUnJZBg>
    <xme:Ah5rZp6tW9blEETqnRV_0KRsIqu2XaS2TMrBIcfKT65VzKb2nslVc7pwZuogyRu2q
    bknY6l537VeZA>
X-ME-Received: <xmr:Ah5rZnc4Dayezc5dkPQ-yVmMY_34_urg5xEcXlXJTETKuRVzAyS_aoZXLFoqxaF2cvqRW4lvs4kQ8svjYMloZ80tFM9yHxu2dKxE4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegve
    evtefgveejffffveeluefhjeefgeeuveeftedujedufeduteejtddtheeuffenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Ah5rZtJg86Z8-AgAXDI8i6UOW_H8jMqfBREm2j_IFPNxLt5mi0Yk8w>
    <xmx:Ah5rZsKpeFgw8dUFFYzd-gmdsKfeSp3TntCSI73ssbfjqgtjit4M_g>
    <xmx:Ah5rZuwvo08ITEfFNKl9ljn-Ead-a-VryPeFdPG4VqeXlCKWNxJ0yw>
    <xmx:Ah5rZgIBt81U74NKoXXDFboFkrfEOFJ9WalvvIZc7eURUvPEgTdb9g>
    <xmx:Ah5rZr8sZzeyk_QMdpR-G0C_ulz0XX-HpBQH6-J4WC8ronMBX1eVsjxL>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 12:27:45 -0400 (EDT)
Date: Thu, 13 Jun 2024 18:27:43 +0200
From: Greg KH <greg@kroah.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <2024061320-palatable-backer-0e4a@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
 <ZmruqWDTG2PK-rbu@sashalap>
 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
 <2024061305-swimming-politely-30f3@gregkh>
 <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 11:11:54AM -0400, James Bottomley wrote:
> On Thu, 2024-06-13 at 16:02 +0200, Greg KH wrote:
> > On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
> > > On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
> [...]
> > > > Could you provide a concrete example? This shouldn't happen.
> > > 
> > > This one has no fixes or cc stable:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
> > > 
> > > Yet here it is backported:
> > > 
> > > Message-id: 20240603121056.1837607-1-sashal@kernel.org
> > > 
> > > (I can't give a lore reference because conveniently it was a
> > > personal cc with no tracked mailing list).
> > > 
> > > I picked that one because we discovered a bug with the strlcpy to
> > > strscpy conversions in SCSI which it looks like this backport has.
> > 
> > It says, in the commit message:
> >          Stable-dep-of: c3408c4ae041 ("scsi: qla2xxx: Avoid possible
> > run-time warning with long model_num")
> > 
> > That is why it was backported.
> 
> Well, that still tracks back to a patch which wasn't tagged:
> c3408c4ae041 is actually fixing a bug in 527e9b704c3d which is another
> of the strlcpy to strscpy patches which also has no cc:stable or fixes
> tag:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=527e9b704c3d

True, kind of impossible for us to ever figure that one out :(

Care to send that to us on stable@vger.kernel.org so that we know to
queue it up?

thanks,

greg k-h

