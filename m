Return-Path: <ksummit+bounces-2287-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255CB41C71
	for <lists@lfdr.de>; Wed,  3 Sep 2025 12:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18770540C43
	for <lists@lfdr.de>; Wed,  3 Sep 2025 10:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C72F746C;
	Wed,  3 Sep 2025 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="QO16MBQ7"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF1D2F3623;
	Wed,  3 Sep 2025 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896852; cv=none; b=PMaYoWCd+YsHUJBU8qDcRFzDQXREKAlKV9yk56OmEOrGODh+M8h1jOeFffDLxZ0MjN7NufKoPpdsn3a7nXmPjseLpxFD8OzMOl4BMw+DTncdmT7n0AvWnRR6tB+6owenCz+5RGxbteEz/CZGfoniXzVsdV+siFO570VANU+ss60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896852; c=relaxed/simple;
	bh=AxxgJ6avajpVkQNkIiUjwsdSBHPeg3VFWG8gTSFOvtY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MEleDcdoxcIG5WnjlI0kS/6haBQ2bvGiTHPWiznr8JkVwjbdntNGinZ1eIWxvCuSe9fwIfX4QMWrVmgD/wiiZaVwxXeFze5XMaTsb/bJqMYM6bvBgiqV7c6c9jvjb087dUMuQ9dLOGdCXUif7KdE8F51X9U/TsvUzuFDhuM4Z+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=QO16MBQ7; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=AxxgJ6avajpVkQNkIiUjwsdSBHPeg3VFWG8gTSFOvtY=;
	t=1756896850; x=1758106450; b=QO16MBQ7PsCiBQVNxTRIFsWvfyIYlO7UH74EO0fz58GDtsh
	TFleePSHWkBpHuvij6bZsv0/76vhw4YgA3JC32XlsUCTrHBq4oTLQKEL/2NumjUTdFDJW/CaWGw0E
	KHWAw3LBjaWxdQ7OdQ+Awh2/wl4W+YiLs2j5Gkf4z1HeXuJ1cek1LkBqENT/F2qQypeHQT5COwoWB
	y6JCHVjvzAZvx+k9JhjWXwedCw3cIOdva5jpd2BTCAKeDeFZBFfZo7rfx2jFuzOmske6N4+MVdEX/
	lkVJQndCYGmiJYxSviLKhHatzdNXtiup14xYXqsM4EyiuZnOUZ2sYL+5X74g9xEQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1utl7t-0000000BhVX-0Lwm;
	Wed, 03 Sep 2025 12:54:05 +0200
Message-ID: <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum	
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation	
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya	 <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Date: Wed, 03 Sep 2025 12:54:04 +0200
In-Reply-To: <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
References: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
			<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
			<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
			<20250901204635.51b81ffd@foz.lan>
			<1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
			<j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
			<865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
			<20250902135938.35048fbc@foz.lan>	<20250902141434.3e5b14e4@foz.lan>
			<8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
			<xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
			<87ecsox4uy.fsf@trenco.lwn.net>	<20250902191929.504977bf@foz.lan>
			<87frd4vfys.fsf@trenco.lwn.net>
			<b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
		 <20250903124229.332dfeae@foz.lan>
	 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2025-09-03 at 12:45 +0200, Johannes Berg wrote:
>=20
> I don't follow. If this setup breaks the build then that's good, I'll
> fix the env. If the build does magic inside and sort of ignores $PATH,
> that's bad.

Or maybe it's not ignoring $PATH, but rather picking the "best"
python3.xy binary from $PATH - still that's annoying because you'd have
to control which ones are there and/or know which ones it might pick.

Far more predictable and usable to just use "python3" and print a
message saying you might want to use a better version if you think it's
too slow.

johannes

