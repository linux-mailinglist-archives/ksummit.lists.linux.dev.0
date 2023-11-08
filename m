Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD627E5F43
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2856B281695
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE60E374CC;
	Wed,  8 Nov 2023 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B9374D0
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id C9F0AC0C97;
	Wed,  8 Nov 2023 20:36:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id C7EFD2002A;
	Wed,  8 Nov 2023 20:36:55 +0000 (UTC)
Message-ID: <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 12:36:54 -0800
In-Reply-To: <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
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
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 36n1nwrpp5m66nmsgrhg3w4ne97e4rqu
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: C7EFD2002A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+ZNEjOqJ4tGFY4bbN+ePJyAC00wxSUUng=
X-HE-Tag: 1699475815-129251
X-HE-Meta: U2FsdGVkX1/daq2BSPP3C5V+F2oBSP4b4a+LhdFUchnQR5shy3sWXZuLsObaA6vMGCCstD3GpfDUiwY9eg4c1rme00I8S121k1HmBpCd/jXNnpquVLvaPrLyLjJuuvj9loMBtTSd2TwGcsIq4Hec+eJwdCTWGKWh9xx12kdWWFZZ7pM0gdfmnsE7+QxUMX2W2RNJjjvwx2xxsFTgvuOWefNVD6kLevO+obs+4kldwj/JDixJpCy8N872jMT+V5LUDqR75x62j3cdMBzSxTRXlb2u4FdDO36wQM3Z20cCF+LuxTogoT1KeO/fCKys2VGA68Gx1kl4IkmTdsGdDzO3HD4xvplFWSpW82cSq/vaGNjJcriu70Km0f7BahwfYxLB

On Wed, 2023-11-08 at 12:14 -0800, Joe Perches wrote:
> On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:

<empty email?  evolution still sucks>

My sent email folder entry for this is:

On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> BTW, you have joined some of the discussions to these patches in the past=
