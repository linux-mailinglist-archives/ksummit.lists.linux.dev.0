Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6307E5E6F
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A45B20BEE
	for <lists@lfdr.de>; Wed,  8 Nov 2023 19:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F237636B05;
	Wed,  8 Nov 2023 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44E36AFB
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 5B124160AB6;
	Wed,  8 Nov 2023 19:14:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 5C9DE2002A;
	Wed,  8 Nov 2023 19:14:46 +0000 (UTC)
Message-ID: <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 11:14:45 -0800
In-Reply-To: <20231108140415.46f84baa@gandalf.local.home>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <20231106110547.6956a430@gandalf.local.home>
	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	 <20231108140415.46f84baa@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5C9DE2002A
X-Rspamd-Server: rspamout06
X-Stat-Signature: zgjpakgq4m3x5f63gqg7cpybp36e7epe
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18eZ0Zkb4hC4rLM74T5X1iMsRZulF19Coo=
X-HE-Tag: 1699470886-780658
X-HE-Meta: U2FsdGVkX1/XcX5+kIWkki382rAc/yvOlSqRubDJkfhgGCRC/vaRQ7ZduDn+0IlUgLQoy58KgKghSUBfI/ecXbTXsyw0VhtmXtZ+B3/nHx0rqnAe+T5iqpL/FOQd/RfWj+8QaticcAhj7c6NBnFqKiZweK/Z1/rkZ49q5blDs7RmG3W5dVq5kqEXnhNbSOds01II5AC0liNVmhZw9iPOTRk/YlZ/xH88cCYWEOk6SYap6BUxXHSPesmbh1carQ+l9yk5CY3278eChFDhMEhw+Gay0csYxIW9T+kOk0+AbXmY99p3RpjzudqFm342smGPrkYBFKQJTf98oGGuemCpZy1y8xGM3D6x4QBX1GjdOb3z0Y7D/9LWiIkRYdJXkJqWJHOhR+FF+HFNRi/f3RnpWjyy40ft3O5lW+ZgZ0gTU6uaQvJSq+Ak5JxfnPM+ywZihT+RUBR+mw4d2W+Oc97D/IlfILMpgUVPFhw3Us7TJo1rwI2GxPHWzA==

On Wed, 2023-11-08 at 14:04 -0500, Steven Rostedt wrote:
> On Wed, 08 Nov 2023 10:16:15 -0800
> Joe Perches <joe@perches.com> wrote:
>=20
> > On Wed, 2023-11-08 at 16:44 +0000, Mark Brown wrote:
> > > On Wed, Nov 08, 2023 at 08:19:46AM -0800, Joe Perches wrote: =20
> > > > On Mon, 2023-11-06 at 11:05 -0500, Steven Rostedt wrote: =20
> > > > > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote: =20
> > >  =20
> > > > > > For this reason, I propose switching the "F: *" entry in MAINTA=
INERS=20
> > > > > > ("THE REST") to patches@lists.linux.dev instead. This list diff=
ers from LKML
> > > > > > in the following important aspects: =20
> > >  =20
> > > > > As long as it doesn't affect those that have L: linux-kernel@vger=
kernel.org =20
> > >  =20
> > > > > All core kernel changes should still go there. =20
> > >  =20
> > > > >  (Scheduler, timing, tracing, interrupts, etc) =20
> > >  =20
> > > > If this is done, perhaps half or more of the lkml
> > > > mailing list entries in MAINTAINERS should be removed. =20
> > >  =20
> > > > This grep shows all the section entries with
> > > > 	L:	linux-kernel@vger.kernel.org
> > > > most of which seem not "core". =20
> > >=20
> > > The suggestion wasn't to use LKML exclusively for core changs but rat=
her
> > > to not have LKML added for everything that has a more specific list. =
=20
> >=20
> > Likely you and I read Steven's suggestion differently.
> > Perhaps Steven wants to clarify.
>=20
> Right. For example, I use linux-trace-kernel@ to add patches to patchwork=
,
> but I prefer the discussions to be done on LKML.

How would that work?  Especially with get_maintainer?

Are people are supposed to start discussions on lkml but
only send patches to a separate list?

What linkage would you expect to offer between a discussion
and a proposed patch?

Subject matching?  People adding Link: markings?

Both of those seem unlikely to be effective.

