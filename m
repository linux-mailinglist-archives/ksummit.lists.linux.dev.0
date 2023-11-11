Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CF67E8BCA
	for <lists@lfdr.de>; Sat, 11 Nov 2023 18:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE400B207DB
	for <lists@lfdr.de>; Sat, 11 Nov 2023 17:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6130C1BDC3;
	Sat, 11 Nov 2023 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="GKU2SH75"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA841B287
	for <ksummit@lists.linux.dev>; Sat, 11 Nov 2023 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-113-74.bstnma.fios.verizon.net [173.48.113.74])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3ABGvCpA009874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 11:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1699721834; bh=Y3SjgoUMb6iptlAlVOZGNmZCKXDeAiddNkGr+8sCnXQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=GKU2SH75QjEf73vGt0InPnhVunwDIGksKndueJcaeGTHV0GIyij+ZczF4Z/kCfTIh
	 MR7MIoHTO5Uglap0nB8Qdhhw+RTzPWV7zUlkdWu+h5ECqY/RhMQTjea1qtO8XSIOIh
	 h45mrkIiDOS1J1EFtikmqXR/dPmlk7XxicyTPOi2P8aZ1H5N7NtODkkLvUQZQ/RwlE
	 dYgtduE6YRtFBNKkEJw/zIg5+2udJinAC3trJidmBvmuyGFjk0y5MFeA/SsEezCKMp
	 WleX9qrbAFen65H6/trTKUovKFsSSsAJEngKEaAV09Gd70JFPD54bm+sDAayMtxSvy
	 4R+p8JwdFNqcA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 544C915C0243; Sat, 11 Nov 2023 11:57:12 -0500 (EST)
Date: Sat, 11 Nov 2023 11:57:12 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>, users@linux.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231111165712.GA35991@mit.edu>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
 <ZUkcyCb5DEVEDkKj@infradead.org>
 <20231106-mega-albatross-of-beauty-f2a7e9@meerkat>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106-mega-albatross-of-beauty-f2a7e9@meerkat>

On Mon, Nov 06, 2023 at 12:41:18PM -0500, Konstantin Ryabitsev wrote:
> All I want is to know is why someone wants to receive a copy of all patches
> via SMTP when much more effective mechanisms to achieve the same are
> available. If someone can provide a valid reason -- such as being a
> high-profile maintainer -- then of course I'll be happy to let them subscribe.

It's not so much wanting to see "all patches", but rather wanting to
be able to see the discussion of a patch.  Perhaps if there is no
other vger list cc'ed on the message, there could be a reply-to: lkml
header set, to redirect messages someplace where it will be more
visible?

After all, we're talking about "THE REST", so these are patches which
don't have some kind of list associated with it, more or less by
definition.  And having discussions about a patch only show up on
patches@ list would be suboptimal.  If we were to address that,
perhaps that would make more people happy who are currently subscribed
to lkml?

And yes, I am subscribed to lkml, which I read^H^H^H^H skim with one
finger resting lightly on the 'D' key.  If there was a good summary
service (hey, maybe we could use one a LLM to provide a summary, with
lore link if people wanted more detail --- only half-kidding) then
that would be great, but I do like to keep a light touch on the pulse
of kernel development, and while LWN is a super-valuable, I'm looking
for the next level of detail...

					- Ted

