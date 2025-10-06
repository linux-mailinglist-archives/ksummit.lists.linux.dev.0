Return-Path: <ksummit+bounces-2427-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A0BBF2E2
	for <lists@lfdr.de>; Mon, 06 Oct 2025 22:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6CB3ADE40
	for <lists@lfdr.de>; Mon,  6 Oct 2025 20:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DCD2D3EF6;
	Mon,  6 Oct 2025 20:22:35 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA11DB12E;
	Mon,  6 Oct 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759782155; cv=none; b=tKoZDnB0hBzGO6bffOduMaLHcxW7pythGshR+KvDPxXDHzsDOCTHUhj98N8ulhbX7Z3iXdCmZ00lYzUSIFUpWtB/hz7HfUfypwTFenCsQR+qFL30zFo1SVo/tJXpP5heQcOOjI9ZES9kHouIp4QSQlfL9FFOg+K5X1w5iaPJGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759782155; c=relaxed/simple;
	bh=LhjB5H9mrCqOGAXj5HXNdyEVYPj6mQQyTvJX1KEHiMI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jHYxgiin8Aj5maU50jptELm1NBlbc60+XOn3m+L03lF/7CpMu3PF7dxhyXiZZxmlHEqc9tCBTruB39RJg6/J9TzKwdz//kt6rEeh1ibAFEkuLANpHQf3ej1CzcfERrnbmz6Hf56vzf9ISnow50Z8SztWmG7zTgfIxKHwwtgKf7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 853FF2B4F9D;
	Mon,  6 Oct 2025 22:15:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JD4v2hnJ6q9P; Mon,  6 Oct 2025 22:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0C4012B03C9;
	Mon,  6 Oct 2025 22:15:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id j6VbrBHYDJpt; Mon,  6 Oct 2025 22:15:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B486A2ABFC1;
	Mon,  6 Oct 2025 22:15:21 +0200 (CEST)
Date: Mon, 6 Oct 2025 22:15:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	heiko <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Andreas Larsson <andreas@gaisler.com>
Message-ID: <1190290449.3827.1759781721487.JavaMail.zimbra@nod.at>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net> <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: 4qe/Jvt6A7Z6bNoIFm3Eugvg7UbUaA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Arnd Bergmann" <arnd@arndb.de>
>>> Has anybody run into actual end user visible problems when using one of
>>> weirdo PAGE_OFFSET configs?
>>
>> In the past I saw that programs such as the Java Runtime (JRE) ran into
>> address space limitations due to a 2G/2G split on embedded systems.
>> Reverting to a 3G/1G split fixed the problems.
>=20
> Right, that makes sense, given the tricks they likely play on the
> virtual address space. Are the 2GB devices you maintain using a JRE,
> or was this on other embedded hardware? How common is Java still in
> this type of workload?

Sorry for the late reply, I was on vacation.

No, the devices with the JRE issues are from a different customer.
Since I work as a consultant lots of strange issues get thrown my way

I wouldn't say Java is super common but I still see it from time to time.
=20
Thanks,
//richard

