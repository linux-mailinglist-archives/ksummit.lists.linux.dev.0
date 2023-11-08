Return-Path: <ksummit+bounces-1200-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A47E600F
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB181C20B3B
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D070374E4;
	Wed,  8 Nov 2023 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="b2b5RoWz"
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3365374CA;
	Wed,  8 Nov 2023 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zWpxLdqSdpI0Nl4LOY7KMFY0dNTcCVZ05UZ1n2/pXck=;
	t=1699479719; x=1700689319; b=b2b5RoWz8K48WVj1t7XhgpgFeyU+lWOu4Tf/1/PObMQc/ZZ
	H4o0+dGedPbtN/O4CuOnjnnvi9X9ZVX5uVGfg8XL5JBJBMTK1+YdgzPERDq2JNPM2zR6nUCvoKWXp
	fcLWXFvgBoUhRT3NQXu1sUqGobkw2p9NFxE3ACFilVOW2SB6wcxyj8TA/42jeJmGbhCmcc7Zal6Y8
	0IP3X9PKDPxNwVnjXjQ8mCy+V3Y0ryGDR6PeTnH2cIjkvrjoOkaNJVD6RcFWAMbOHZ03KdW8tuH6j
	E5Jhp1Kpm4V38ehhURKYiWD6pLwcBRS3iPCUT/JQRa6PX2h+WKDy3athxn11zQOQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r0pwl-00000000mwk-0I2T;
	Wed, 08 Nov 2023 22:18:47 +0100
Message-ID: <af631204f66cefb63b0980d2bd58b5f808867bd9.camel@sipsolutions.net>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Johannes Berg <johannes@sipsolutions.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Bird, Tim"
 <Tim.Bird@sony.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  "users@linux.kernel.org" <users@linux.kernel.org>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Date: Wed, 08 Nov 2023 22:18:45 +0100
In-Reply-To: <d9309638d8f6037e661c3450ef3342dd915d66eb.camel@HansenPartnership.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
	 <d9309638d8f6037e661c3450ef3342dd915d66eb.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2023-11-08 at 16:04 -0500, James Bottomley wrote:
> On Wed, 2023-11-08 at 20:04 +0000, Bird, Tim wrote:
> > Is there a way to use b4, lei, lore, etc. for responding to mail on a
> > list one is not subscribed to?
>=20
> lore has a "reply" link which formats a reply correctly to be in-reply-
> to the email (provided your local mail client supports this).
>=20

If it doesn't or you want the email to quote it, you can also click the
'raw' link, download the file and import it (it's a one-mail mbox), and
then reply. Kind of like the b4 suggestion, just without the tool.

Now if you want to actually reply from gmail, I don't know how to get
that in there, but I guess there's some way.

johannes

