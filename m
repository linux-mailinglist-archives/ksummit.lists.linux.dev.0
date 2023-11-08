Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D67E5D23
	for <lists@lfdr.de>; Wed,  8 Nov 2023 19:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3B6D1C20AD7
	for <lists@lfdr.de>; Wed,  8 Nov 2023 18:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B5A358BC;
	Wed,  8 Nov 2023 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220936AE6
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 6C98B140BB1;
	Wed,  8 Nov 2023 18:16:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 2721F2000F;
	Wed,  8 Nov 2023 18:16:16 +0000 (UTC)
Message-ID: <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 10:16:15 -0800
In-Reply-To: <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <20231106110547.6956a430@gandalf.local.home>
	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: zz3e1eyqinjy4u79fu7wbhdnrajq77mx
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 2721F2000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18xtHorsbjwCHykZbTtCXQYcwW3qKLEAuM=
X-HE-Tag: 1699467376-409563
X-HE-Meta: U2FsdGVkX18Ppu+02Y79QRcAJTpX3eNPE6kjGvR/J7nIj5q3chUCygwUJaufmnoGSrEIXKOtfZX9hNLBTn5bDoiOBHIsx60Ghpj6shGpotzkXcxjilKdaawf9ltalPWq3WOE21WwKgVDhD8VPlRTfkLr7nDTqSIXhSjqdPBcYyu5vfz45UiXzqddVg/vSnjjF1G7kr9xqpQiOm1l/pfo1DwRr15s1+bzjrbvjvlIqEKVRyA5vq+MAEoYwDsGdXjQiDtMRsXHeTmWCP3ib1IwnRNOfv80WHOpktnbtdeZVJTl4q1Bd9TTVOMZ5qZrvo+Ra9AQntt2Ei4MfbR1kVe6unw+2YdTBQQ9CY81xbcOO0gfDubsQ11iXEN1VaBVP6QrlhWnFkJMxCua3SqB00hDCTgy1viesSn8b8rKacwvT7TsJC8ag1nv0brU5uxoonwv

On Wed, 2023-11-08 at 16:44 +0000, Mark Brown wrote:
> On Wed, Nov 08, 2023 at 08:19:46AM -0800, Joe Perches wrote:
> > On Mon, 2023-11-06 at 11:05 -0500, Steven Rostedt wrote:
> > > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
>=20
> > > > For this reason, I propose switching the "F: *" entry in MAINTAINER=
S=20
> > > > ("THE REST") to patches@lists.linux.dev instead. This list differs =
from LKML
> > > > in the following important aspects:
>=20
> > > As long as it doesn't affect those that have L: linux-kernel@vger.ker=
nel.org
>=20
> > > All core kernel changes should still go there.
>=20
> > >  (Scheduler, timing, tracing, interrupts, etc)
>=20
> > If this is done, perhaps half or more of the lkml
> > mailing list entries in MAINTAINERS should be removed.
>=20
> > This grep shows all the section entries with
> > 	L:	linux-kernel@vger.kernel.org
> > most of which seem not "core".
>=20
> The suggestion wasn't to use LKML exclusively for core changs but rather
> to not have LKML added for everything that has a more specific list.

Likely you and I read Steven's suggestion differently.
Perhaps Steven wants to clarify.


