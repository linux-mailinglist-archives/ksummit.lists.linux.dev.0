Return-Path: <ksummit+bounces-1049-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2559783DC5
	for <lists@lfdr.de>; Tue, 22 Aug 2023 12:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F141C2099D
	for <lists@lfdr.de>; Tue, 22 Aug 2023 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0EE9460;
	Tue, 22 Aug 2023 10:20:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD1944B
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 10:20:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 437FE22C24;
	Tue, 22 Aug 2023 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1692699603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=loFyIhFIz0QIbFgPHNWbQyeIdn+jnVIPnc+wnAzYPS8=;
	b=Jx4WYIfAgEkn+QdQw9xbbbZfLX88jkwu+l6l4lW03YnnRfdxizjsntoHAyS7Bi0e+Uf3cL
	OwKqz/c4dBY+X+jGXpXxIZdHVahanIGWki5p30hSJtKJbGplRPnpK7VkIFviyhkUf6UClk
	VzOXL8vTvq78c5SPbSqaNOQq2l+3bEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1692699603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=loFyIhFIz0QIbFgPHNWbQyeIdn+jnVIPnc+wnAzYPS8=;
	b=VDX0VCeVuMGaBPNZcixeeIj5BP5r5MhDewbIpyYxGRhG3UTrk2U1H+OeMA3+/Bosxsftmh
	iscWXwF3OlPl3iAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 314E613919;
	Tue, 22 Aug 2023 10:20:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EfD5C9OL5GQ2IQAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 22 Aug 2023 10:20:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id AFD3EA0774; Tue, 22 Aug 2023 12:20:02 +0200 (CEST)
Date: Tue, 22 Aug 2023 12:20:02 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Vegard Nossum <vegard.nossum@oracle.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230822102002.ogandzgm76hm6dnq@quack3>
References: <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
 <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
 <20230822094613.bxtsjlnkhaypoflj@quack3>
 <20230822-komitee-erreichbar-4dff01dec543@brauner>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822-komitee-erreichbar-4dff01dec543@brauner>

On Tue 22-08-23 12:10:26, Christian Brauner wrote:
> > I agree it is good to create positive incentives to provide good review.
> > But I believe what really makes people do good reviews is the sense of
> > common responsibility - you don't want buggy or misdesigned stuff to get
> > into the subsystem you work with because that's going to make life harder
> > for everybody including you in the future. And I understand the "tragedy of
> 
> Yes, this is a Herculean task and often just results in complaints that
> this is unnecessary non-technical pushback.
> 
> > commons" (IOW selfishness) works against this so incentives or
> > review-trading or other methods can help but ultimately it is IMHO about
> > making people understand and accept this shared responsibility...
> 
> Yes, but in order to encourage and incentivize shared responsibility the
> environment must feel sufficiently safe and have a good model of shared
> ownership. I think we often still have deficits in both (with
> differences between subsystems).

We are in full agreement here :).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

