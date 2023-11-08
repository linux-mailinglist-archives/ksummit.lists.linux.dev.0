Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7B7E5F08
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CAB02813B7
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC0F3716A;
	Wed,  8 Nov 2023 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDF30341
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id A4038120CBB;
	Wed,  8 Nov 2023 20:14:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id A2D3620027;
	Wed,  8 Nov 2023 20:14:53 +0000 (UTC)
Message-ID: <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Date: Wed, 08 Nov 2023 12:14:52 -0800
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
X-Rspamd-Queue-Id: A2D3620027
X-Stat-Signature: y45ybparcpbipph5xrh75ah4whbmsbtw
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+xzUnc191JhPJlSN6SMU/qltJe5ppUf+U=
X-HE-Tag: 1699474493-779491
X-HE-Meta: U2FsdGVkX1/BJa0Taun1pph8xznUQ7N2opbYP58Qf6lwpp8h+lNi0HrMeroKlP514xcGNFJh4wjLhj5tFZHr/5ejO4k7HTgkCJW/DJ3hwZ4w8lXX9Qhqg8giaPeyRuShkQ54LZVL/cDkRg8AfyIXNXRwPF25sMsLXGvYpLY9ObmOxLRktF7kJLrvsFLgQ0/gAogamCxriGmXwfVZWlCCI7qOQBxD7x6uNYVhq9HNKXelwJUymaF6AMXsop6Ul1lgBx7bm97OVCiu7IxNbSR3LaHldCUay+s8ESAIFVnSLPgErSvgqaqqttm6hDSos7maBNNXsWMhL6Edk4zI4NrhR12INzJd1NTf0YwvkZK8+3kNfjjhcKEhPdzuEe9gWYiD

On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> BTW, you have joined some of the discussions to these patches in the past=
