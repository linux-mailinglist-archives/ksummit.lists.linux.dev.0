Return-Path: <ksummit+bounces-1196-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EA7E5F9B
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7C31C20BED
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E67374C7;
	Wed,  8 Nov 2023 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="CLyNxqPf";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="CLyNxqPf"
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996D3717F
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1699477468;
	bh=d0agQpIrmCkgzr9aJxBOVG2pkYdLDfgQAQaU1OjzWjc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=CLyNxqPfXxFbvHXfDPRYrt+xR5GzQfX8ixJqeTfkL0Mh5E/AQEKX4YdNcC3+SBd03
	 lfaPRtjuh7KRsa7K7krq7atCCOyFc11z6uvt0godcdjBzhJBdXBd6TWH8qA8XUt3rp
	 KgMNmu8d9fe2lP09hIClcGADhwQwayKBVRxdxBnI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7AD2C1287A8C;
	Wed,  8 Nov 2023 16:04:28 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 3BTbLsh_04Ci; Wed,  8 Nov 2023 16:04:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1699477468;
	bh=d0agQpIrmCkgzr9aJxBOVG2pkYdLDfgQAQaU1OjzWjc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=CLyNxqPfXxFbvHXfDPRYrt+xR5GzQfX8ixJqeTfkL0Mh5E/AQEKX4YdNcC3+SBd03
	 lfaPRtjuh7KRsa7K7krq7atCCOyFc11z6uvt0godcdjBzhJBdXBd6TWH8qA8XUt3rp
	 KgMNmu8d9fe2lP09hIClcGADhwQwayKBVRxdxBnI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DE66A12865E0;
	Wed,  8 Nov 2023 16:04:27 -0500 (EST)
Message-ID: <d9309638d8f6037e661c3450ef3342dd915d66eb.camel@HansenPartnership.com>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Bird, Tim" <Tim.Bird@sony.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "users@linux.kernel.org"
 <users@linux.kernel.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Date: Wed, 08 Nov 2023 16:04:26 -0500
In-Reply-To: <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 20:04 +0000, Bird, Tim wrote:
> Is there a way to use b4, lei, lore, etc. for responding to mail on a
> list one is not subscribed to?

lore has a "reply" link which formats a reply correctly to be in-reply-
to the email (provided your local mail client supports this).

For something like gmail, which doesn't have a local client, you can do
it the old fashioned way: download the mbox of the email, import the
mbox into a folder and then reply to the message.

James


