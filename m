Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6EA7E5F56
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30716B20E1C
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954B3328D2;
	Wed,  8 Nov 2023 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4637151
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 08DC7C0C52;
	Wed,  8 Nov 2023 20:41:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id DA35020024;
	Wed,  8 Nov 2023 20:41:56 +0000 (UTC)
Message-ID: <3eee9b9494870c20e189133eeac6af100f591af7.camel@perches.com>
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 12:41:55 -0800
In-Reply-To: <20231108150749.13b7a0ee@gandalf.local.home>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <20231106110547.6956a430@gandalf.local.home>
	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	 <20231108140415.46f84baa@gandalf.local.home>
	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
	 <20231108143447.12d73140@gandalf.local.home>
	 <20231108150749.13b7a0ee@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: DA35020024
X-Stat-Signature: k3fpnyofdpfa1go1cwe4qx1r5dzgf8qq
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18AZJeauIe8gsf6+XqfTrqV/JCMwRkJw0I=
X-HE-Tag: 1699476116-185375
X-HE-Meta: U2FsdGVkX1/i1uZ9DMu9qgMxF7OUBasMmiC+Yj4KBjyxNipepnS2bvmWox7raJZ7YnjsuOu3zKTXybZ4WZHs1Aclf6t6TErPMvMeahn19aCHIe/IAZBaU7oCq5VaFFXQ6WkBrUxYvQVKl4vW2uwffwD/aUA28URB273EjtEVbhuP9zi/dAML77UzucyKJvdo8fqX2Wxk/j52KTNRkVGaDqI1UNrxBErKmWEwtonERQWsK7bT1/RQ821XLPZcC7uC3NTbsf5JY8bN+X76++hGOjeHNlktlaHZhmMkgnzyK64PhbHywJ/y7BftaVJD2m6Q3q8BAKfXO0HhRcfkhfL9QDxntzMwnxXVgkCglfT8TR3iiaRfmAgGZiy2FFSJQfFwNRCNzybxOKY+Tm6nQS4L3fz9KCpvRxz/YmvP7QXDLkmw5J0GMBLMpw/TNqzKBP7r

On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> On Wed, 8 Nov 2023 14:34:47 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>=20
> > I use to only do discussions on LKML and have myself Cc'd (or Cc myself=
 in
> > the discussions), but then I couldn't manage the patches from my inbox.=
 So
> > I set up the mailing list and added that to be Cc'd too in MAINTAINERS,=
 so
> > that everything goes to the other mailing list as well. That would then=
 keep
> > the patches in patchwork, but the discussions would still be visible to=
 the
> > general audience on LKML.
>=20
> BTW, you have joined some of the discussions to these patches in the past=
