Return-Path: <ksummit+bounces-996-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D457277E535
	for <lists@lfdr.de>; Wed, 16 Aug 2023 17:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F382281B2C
	for <lists@lfdr.de>; Wed, 16 Aug 2023 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117E815ADD;
	Wed, 16 Aug 2023 15:34:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from second.openwall.net (second.openwall.net [193.110.157.125])
	by smtp.subspace.kernel.org (Postfix) with SMTP id ED3A810957
	for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 15:34:04 +0000 (UTC)
Received: (qmail 21996 invoked from network); 16 Aug 2023 15:26:41 -0000
Received: from localhost (HELO pvt.openwall.com) (127.0.0.1)
  by localhost with SMTP; 16 Aug 2023 15:26:41 -0000
Received: by pvt.openwall.com (Postfix, from userid 503)
	id F2102A064D; Wed, 16 Aug 2023 17:26:21 +0200 (CEST)
Date: Wed, 16 Aug 2023 17:26:21 +0200
From: Solar Designer <solar@openwall.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues -- security@korg vs. linux-distros@
Message-ID: <20230816152621.GA8252@openwall.com>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
User-Agent: Mutt/1.4.2.3i

On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
> (Sending this with a few extra people in Bcc so they'll see it without
> getting spammed with replies if they don't want them.)

Thank you, Vegard!

I've also now skimmed this thread at
https://lore.kernel.org/ksummit/nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm/T/#t

I also found interesting the adjacent thread on "Quality standards for
embargoed code".

I notice these are tagged "MAINTAINERS SUMMIT", I assume in reference to
the one in Richmond, VA on November 16th, 2023?  I cannot easily get to
the US, but I'd consider getting to the summit in Bilbao, Spain on
September 19-21 if the relevant people would be there as well and my
attendance would be expected to help?  I don't think there's anything we
can't discuss over e-mail (and in fact e-mail is more specific), but
meeting in person is a gesture that might help establish an atmosphere
of trust and assurance of good intent.

> I think it's worth pointing out that the latest update to the
> documentation (where reporters are discouraged from reporting kernel
> issues to linux-distros@ ever)

It isn't "ever" - rather, it is "NEVER contact the "linux-distros"
mailing list until AFTER discussing it with the kernel security team."
So the kernel security team can, perhaps after having arrived at a fix,
choose to direct the reporter to also contact linux-distros.  Now, I
don't know whether this would actually be happening or not.  Maybe some
friendly dialogue and agreeing on things could affect that.

> came just after a private discussion (on
> both mailing lists) about the StackRot/CVE-2023-3269 vulnerability where
> Linus in particular came out hard against the linux-distros policy, in
> particular the requirement to disclose PoCs if those were shared with
> the list in the first place. I therefore think that Linus himself needs
> to be involved in this discussion and that his arguments need to be made
> in public instead of just paraphrased by me.

In that private thread, two linux-distros policy aspects came up as
being inconsistent with s@k.o preferences:

1. For s@k.o, public disclosure is typically in up to 7 days since fix
is ready, but for linux-distros the deadline is 14 days max since
linux-distros is notified even if the fix is not ready.  Apparently,
this one makes Greg particularly unhappy about linux-distros.

2. _If_ the reporter shares PoCs/exploits with linux-distros, then per
current policy those should also be made public (within up to 7 days
more after the vulnerability is publicly disclosed as such).  Linus said
that this must be up to the reporter only, and we should not be imposing
such policy.  In a sense, this is already up to the reporter - if they
disagree, they just shouldn't post PoCs/exploits to linux-distros (can
instead post an offer to share with individual distros) - however, this
is problematic in practice because not everyone reads the rules before
posting and sometimes people change their mind during the embargo time
(or are required to "change their mind" by their employer, etc.)

I agree both of these are problems, and I suggest discussing them on
oss-security.  Maybe we can arrive at satisfactory solutions/exceptions.

While we're at it, I'd like to point out that while the wording (in the
commit above) that "the linux-distros rules do not contribute to
actually fixing any potential security problems" is technically correct
(yes, the _rules_ do not contribute to _upstream_ fixes), it may be
misleading.  It implies that linux-distros members would not help fix
bugs, whereas in that very StackRot/CVE-2023-3269 thread Vegard,
receiving the messages as part of Oracle Linux's linux-distros
membership, has actually contributed to fixing the bug upstream.  Vegard
is probably too humble to bring this up, so I do.  Also, even when not
contributing to upstream fixes, linux-distros members will generally
"contribute to actually fixing any potential security problems" in their
respective distros (even if e.g. by back-porting upstream fixes when
those are ready).  So I would omit this wording if it were up to me.

> On 8/15/23 11:28, Jiri Kosina wrote:
> >With my distro hat on, I really want the kernel security bugs to be
> >*eventually* processed through linux-distros@ somehow, for one sole
> >reason: it means that our distro security people will be aware of it,
> >track it internally, and keep an eye on the fix being ported to all of our
> >codestreams. This is exactly how this is done for all other packages.
> >
> >I would be curious to hear about this from other distros, but I sort of
> >expect that they would agree.
> 
> +1 from me; the distros list has been an extremely important resource
> for distros in order to get fixes shipped out with minimal delay.

Yes, I'd like this to be happening as well, and the current kernel
documentation does not preclude that from happening.  So now it's up to
the people on s@k.o.

> >[1] https://git.kernel.org/linus/4fee0915e649b

Alexander

