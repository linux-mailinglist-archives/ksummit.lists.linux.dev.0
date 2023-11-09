Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2F7E7200
	for <lists@lfdr.de>; Thu,  9 Nov 2023 20:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED9EE1F2161E
	for <lists@lfdr.de>; Thu,  9 Nov 2023 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC0E341BF;
	Thu,  9 Nov 2023 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4331A6D
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 19:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id DCF1C140556;
	Thu,  9 Nov 2023 19:11:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 6C1902D;
	Thu,  9 Nov 2023 19:11:09 +0000 (UTC)
Message-ID: <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Alex Elder
	 <elder@ieee.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Mark
 Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Date: Thu, 09 Nov 2023 11:11:08 -0800
In-Reply-To: <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	 <20231106110547.6956a430@gandalf.local.home>
	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	 <20231108140415.46f84baa@gandalf.local.home>
	 <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
	 <20231109092701.GG21616@pendragon.ideasonboard.com>
	 <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
	 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 8m4nb4rnot5bt7srmzq7fjiqc7fddamx
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 6C1902D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+nysL2rEWMQEsFrY7CRGaKfOG+RvAKLrU=
X-HE-Tag: 1699557069-859773
X-HE-Meta: U2FsdGVkX1+HgGX0DL4rqgN3Ev8Tkqkap+P3eXP2zti6K0jmiuHxWNGlqBKcM7d88mlxcu2/g1dR1lmjJA6sCboT2nl1vy4X+2b8cgyR5kQjfhSLoM1UdHgekkoJm1sHWt/ONvQygcnE1LWhE78BCWnctRSvBMnnI4EU2byLV4sb+JXwVFzx9hE1aYum7laoT9CKcjeIC9l6slq0zaSKEXNZAp7MHVYCHKccnqgJj9Adof5NgTI8Yyf1liae7vizDFtZRIKuTxWUDiyPnV2ElL57+DOfkmm8zME5m0W4uSpP9cKD8TSSxJmp8sOPRTDEeSzeb/9YlSW/6yhzkeQiWat0hyLuGVlznFvDhBN3QxD5eHy4yHZQG2SXXvIVGFZT

On Thu, 2023-11-09 at 12:25 -0500, Konstantin Ryabitsev wrote:
> On Thu, Nov 09, 2023 at 11:14:38AM -0600, Alex Elder wrote:
> > My input is that whatever the outcome of all this discussion, please
> > define it as policy and have get_maintainer.pl implement it.  I don't
> > want to have to think too hard about who *should* be included (beyond
> > people I already know).
>=20
> Yes, I fully agree with you -- people shouldn't need to know where the pa=
tches
> should be going. The tooling should decide this for them, and I want to c=
hange
> the tooling so that it no longer includes linux-kernel@vger on everything=
,
> only on patches without any other mailing list matches.

Relatively easy to do, but what about your original request/suggestion
to use patches@lists.linux.dev ?


