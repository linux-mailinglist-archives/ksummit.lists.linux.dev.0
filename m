Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FD7E5F78
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A481FB20E6D
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F05637151;
	Wed,  8 Nov 2023 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0E532C6E
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id C4443120CD9;
	Wed,  8 Nov 2023 20:49:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id C6EEC20028;
	Wed,  8 Nov 2023 20:49:14 +0000 (UTC)
Message-ID: <88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com>
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 12:49:13 -0800
In-Reply-To: <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <20231106110547.6956a430@gandalf.local.home>
	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	 <20231108140415.46f84baa@gandalf.local.home>
	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
	 <20231108143447.12d73140@gandalf.local.home>
	 <20231108150749.13b7a0ee@gandalf.local.home>
	 <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
	 <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: wggy5taj9mqmfuogtmx86hxuqtjersgu
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: C6EEC20028
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18qiRppxu1mpwr+5NB2JHzz3NOuJetDjYA=
X-HE-Tag: 1699476554-505269
X-HE-Meta: U2FsdGVkX193d8Q2Sn59pLyTbcaJg32Oj+bO1gmFJ5JP2j6WyXvkSIb60cu1dhTm1WaWnt3WajwVKQdt/VTuQRUzLl3FRPXwBhIgPBsKmDh1aQ7rM5kltFh8Mo7s6pARtKMNsEAsrc6vzbub2rUN+aeUgyNklRmrv4ltzBP7Nmw/uQuHQZY/OgzqVW/yacl20Y+gRAHIdhzO7ubeV7TqZfeoxCGhcarNU2LJvyJrfqGNTOCA1Rqu13uAxLrsyUkp51sTb3zyolqr/itYIq5O0zdI13zZ+dqVfAsViWTek++gix15JbvgxvnS4cggUg+1z4SLWphq68NkNqdw3/MdefCraeAwApiaTKpEoMdfPa7Ml+iyxHDw0I8quBQJmPH1

fourth try, this time above the fold, no idea why these
are showing up on ksummit as blank.

Nope.

I'm not even subscribed to lkml and now rarely join discussions at all.

Basically I look at lore every now and again using keyword searches
then download messages of some threads manually.


On Wed, 2023-11-08 at 12:36 -0800, Joe Perches wrote:
> On Wed, 2023-11-08 at 12:14 -0800, Joe Perches wrote:
> > On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
>=20
> <empty email?  evolution still sucks>
>=20
> My sent email folder entry for this is:
>=20
> On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > BTW, you have joined some of the discussions to these patches in the pa=
st


