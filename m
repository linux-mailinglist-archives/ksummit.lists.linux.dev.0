Return-Path: <ksummit+bounces-2286-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E322B41C2A
	for <lists@lfdr.de>; Wed,  3 Sep 2025 12:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB6A1BA6193
	for <lists@lfdr.de>; Wed,  3 Sep 2025 10:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6771D16F265;
	Wed,  3 Sep 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="hF29nqav"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE34204E;
	Wed,  3 Sep 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896339; cv=none; b=GIAkE4yeq9eEmEvoWueMZx2OsxMyNRWVqiKIgLfVEd7oYYDvhdqg3AfHulo7pQDP04cVlZXKxiCiY3oNVVxHp27NjZoAEzukepTIHokpSx2diMp7oLv+2Y+kX4n3TGYhzC+/VghVY+85LBtT+GGvtiMzUK7se+kqG3q4rEBpVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896339; c=relaxed/simple;
	bh=10p7eDyGz4kyDf+IxN6RpfDdyR829KAOPLqiD+PQ+b8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNYFe/6OT4kfI5593v6fZpO6gtjjuwYymLZhYFinwlL3BmcDkmArl9fED1rZgmaDT8zoNbtallQSzkFrWSsc5E0OuBTtpCEmYQt/OslFSOLHUzXpPSse9FJe4fnIQPhqDf3iYckuG0Sw6h2O9hY3XBKoLz4uViKmG6CB9fVYM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=hF29nqav; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=10p7eDyGz4kyDf+IxN6RpfDdyR829KAOPLqiD+PQ+b8=;
	t=1756896338; x=1758105938; b=hF29nqavFaf0JpIXId9NujDeV0ZCTOb0MHexPjKAFgeIBR7
	/0zeSGB/IG8tSiiHjWOoD4OC/9oY9AQxQP3jDEvvb5ONkSM4Hmkue6Hdln4z/0x7jVE+5At17C44n
	qKtOExICX23ZoTYhl9ODcuFSRIGXhKqvHpR8zToAFY2LaS0s+7kvcw5WRCv0vfv552CDqNnso/yQU
	sZlWPRffjXhakdCvoGoK0JpoBHLmRQutm/eaTYfWNVH4ydRaPjvZnyvZYAaNKyVB9Nary2hbQrrLO
	JOeR6ySLvGG2U61oHHwebgHq26+3MNuKQ/NWhfUxC9MSwbjBfl4IWSBlC8jsdjwQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1utkzW-0000000BgzB-0Cva;
	Wed, 03 Sep 2025 12:45:26 +0200
Message-ID: <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum	
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation	
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya	 <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Date: Wed, 03 Sep 2025 12:45:25 +0200
In-Reply-To: <20250903124229.332dfeae@foz.lan>
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

On Wed, 2025-09-03 at 12:42 +0200, Mauro Carvalho Chehab wrote:
> > For example, use case we have: using nix-shell to lock down the softwar=
e
> > used to build, for reproducible builds and similar reasons. Without --
> > pure, PATH may still contain (last!) software from the system itself,
> > but it should basically never be used.
>=20
> if the PATH is mangled, you'll have a lot more problems than just
> building docs as it will pick wrong exec files anyway.

Err, no? To search a binary, directories in $PATH are meant to be
searched in order of appearance. It's well-defined which one you pick
for which, and this setup takes advantage of that (with a rather long
$PATH) to control the binaries used for the build.

> In the particular case of docs, if you have, for instance, two different
> python versions, one with sphinx and another one without it, it may pick
> the wrong one, causing the build to fail. There's nothing the build syste=
m
> can do to solve it. The proper fix would be to wrap the calling logic
> to save the env before running under nix-shell, restoring env afterwards.

I don't follow. If this setup breaks the build then that's good, I'll
fix the env. If the build does magic inside and sort of ignores $PATH,
that's bad.

johannes

