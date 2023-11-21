Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4E7F31AE
	for <lists@lfdr.de>; Tue, 21 Nov 2023 15:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE7F1C21A4D
	for <lists@lfdr.de>; Tue, 21 Nov 2023 14:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D69B51C31;
	Tue, 21 Nov 2023 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972453A1
	for <ksummit@lists.linux.dev>; Tue, 21 Nov 2023 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 57F49B5B9E;
	Tue, 21 Nov 2023 14:53:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 60FCF2000E;
	Tue, 21 Nov 2023 14:53:30 +0000 (UTC)
Message-ID: <12ff8c26fd08ce1eec1934f1abc1be72090177c9.camel@perches.com>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, ksummit@lists.linux.dev
Date: Tue, 21 Nov 2023 06:53:29 -0800
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 60FCF2000E
X-Rspamd-Server: rspamout02
X-Stat-Signature: y8p69ng3yamrwbcin4juy1kaw7azjia3
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+wThaeOIln8ghzSzGdDEsHtmpDhXaH664=
X-HE-Tag: 1700578410-355385
X-HE-Meta: U2FsdGVkX184NUyCro7QNLQg8DH53yrzkTNMLBsuIRzcYduA+u3UFpOC3az79dbnt781H9MZuu8U0NkKXay0sMgi6L+9Nubw/EA2pDOlTxhoqGR1zPGRKHoqlc0uid0myu+XEP2tWOWwFwO+R4acd31zLJ+qavZblooajDAkfG4LAhcfxIxWLIIkR+5NuavReTN2V4CMRTYXsbYlHW4FbeQ6QTmx0pR4PA8j6mAA0ZN4NJS9cjiMYDHTqK/qhyAugMc7NmRmiZhFiMsWdC5mrsQl/7UORwsBZKvqqVHvOAsFCNKeH+r+8jekoDC7oFo2X33PVjrTAhU6Mn5DqS9RKj8OXoplmjKpiibijh1w3/HaBeZH7VowJ4nGxEMlhLscTeeb5fSkOV1VFkwgywqlWw==

On Mon, 2023-11-06 at 10:33 -0500, Konstantin Ryabitsev wrote:
> For this reason, I propose switching the "F: *" entry in MAINTAINERS=20
> ("THE REST") to patches@lists.linux.dev instead.

Any agreement on this?


