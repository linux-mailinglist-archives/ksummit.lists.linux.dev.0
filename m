Return-Path: <ksummit+bounces-1067-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5DF788573
	for <lists@lfdr.de>; Fri, 25 Aug 2023 13:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517302817C7
	for <lists@lfdr.de>; Fri, 25 Aug 2023 11:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A47CA64;
	Fri, 25 Aug 2023 11:17:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20809C2EB
	for <ksummit@lists.linux.dev>; Fri, 25 Aug 2023 11:17:04 +0000 (UTC)
Received: from theinternet.molgen.mpg.de (theinternet.molgen.mpg.de [141.14.31.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: buczek)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D5FEB61E5FE06;
	Fri, 25 Aug 2023 13:17:01 +0200 (CEST)
Subject: Re: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
To: Solar Designer <solar@openwall.com>, oss-security@lists.openwall.com
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jiri Kosina <jkosina@suse.cz>,
 ksummit@lists.linux.dev
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <20230816152621.GA8252@openwall.com>
From: Donald Buczek <buczek@molgen.mpg.de>
Message-ID: <12aa367f-9934-7450-1016-fe303c72cc5a@molgen.mpg.de>
Date: Fri, 25 Aug 2023 13:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230816152621.GA8252@openwall.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi, Alexander and all,

I was more or less waiting for a public discussion to start on oss-security or somewhere else, because I'd like to express how important the announcements of Linux kernel issues via linux-distros is to us.

We operate the IT infrastructure of a scientific research institute (456 users, 144 Linux servers, 98 Linux workstations, about 6 PB used storage). We are not using any distro, everything is build locally and we maintain the systems by continuous rolling upgrades. 

All systems from workstations to cluster servers run the same (set of) kernels and identical userspace. The setting is rather unusual these days, all shared storage including homes is on software raid and available to the other systems via automounted nfs. We have a few public servers and a rather big computer cluster with a job scheduler. Everything is multi-user. We need to maintain separation between users and to defend the systems against attacks from the (possible abused) unprivileged user accounts. 

Our scientist run software on cluster-servers which often take many, many days to complete because of the size of the input data. Other might, for example, experiment with Jupyter Notebooks and have a lot of in-memory state. We have long running remote login sessions round the clock. For efficiency, most things run natively on hardware and not in virtual machines. System reboots have a lot of negative impact for our users.

Even nowadays not everything is single-user or microservices. "All users of the X:X kernel series must upgrade" or "just run mainline" is not a helpful strategy for us, because there is the operational issue of booting into a new kernel. Also, because we have a rather unusual settings, it is not unusual that we run into bugs others haven't discovered before. That's why we rather test new releases and roll them out slowly. That may be a corner case, but these corner cases exist, too.

We heavily rely on the information about kernel security issues published to linux-distros, which we, of course, can only receive via oss-security after the embargo. We analyze each and every new topic on oss-security to decide, whether it is relevant to us and what we can do about it. Nearly all of the userspace issues are of no relevance to us, but many of the kernel issues are, if we happen to run affected kernel versions. 

We go a long way to avoid rebooting. This might be as easy as disabling unused dynamic modules by just removing the .ko files from userspace, but sometimes we even convert an upstream fix into a loadable module which uses ftrace to replace or wrap the buggy functions in the running systems. A "reboot party" would only be a measure of last resort. 

oss-security gives us the notifications and enough information or references so that we can deal with the problems. We can not just follow mainline (or a stable series) and analyze every patch ourself to identify, whether a security bug was silently fixed. We can not boot into a new kernel every few days, just in case.

Exploits are sometimes helpful, too, for example to quickly identify whether we run affected versions, which sometimes isn't that trivial to find out otherwise, or to verify that our mitigations are working as intended. 

I would very much appreciate if a policy could be found with the kernel community that encourages to send information to linux-distros. If that requires that the rather strict procedures and deadlines of linux-distros are relaxed, I hope there is room for compromise.

Best

  Donald

On 8/16/23 5:26 PM, Solar Designer wrote:
> On Tue, Aug 15, 2023 at 12:17:03PM +0200, Vegard Nossum wrote:
>> (Sending this with a few extra people in Bcc so they'll see it without
>> getting spammed with replies if they don't want them.)
> 
> Thank you, Vegard!
> 
> I've also now skimmed this thread at
> https://lore.kernel.org/ksummit/nycvar.YFH.7.76.2308160014330.14207@cbobk.fhfr.pm/T/#t
> 
> I also found interesting the adjacent thread on "Quality standards for
> embargoed code".
> 
> I notice these are tagged "MAINTAINERS SUMMIT", I assume in reference to
> the one in Richmond, VA on November 16th, 2023?  I cannot easily get to
> the US, but I'd consider getting to the summit in Bilbao, Spain on
> September 19-21 if the relevant people would be there as well and my
> attendance would be expected to help?  I don't think there's anything we
> can't discuss over e-mail (and in fact e-mail is more specific), but
> meeting in person is a gesture that might help establish an atmosphere
> of trust and assurance of good intent.
> 
>> I think it's worth pointing out that the latest update to the
>> documentation (where reporters are discouraged from reporting kernel
>> issues to linux-distros@ ever)
> 
> It isn't "ever" - rather, it is "NEVER contact the "linux-distros"
> mailing list until AFTER discussing it with the kernel security team."
> So the kernel security team can, perhaps after having arrived at a fix,
> choose to direct the reporter to also contact linux-distros.  Now, I
> don't know whether this would actually be happening or not.  Maybe some
> friendly dialogue and agreeing on things could affect that.
> 
>> came just after a private discussion (on
>> both mailing lists) about the StackRot/CVE-2023-3269 vulnerability where
>> Linus in particular came out hard against the linux-distros policy, in
>> particular the requirement to disclose PoCs if those were shared with
>> the list in the first place. I therefore think that Linus himself needs
>> to be involved in this discussion and that his arguments need to be made
>> in public instead of just paraphrased by me.
> 
> In that private thread, two linux-distros policy aspects came up as
> being inconsistent with s@k.o preferences:
> 
> 1. For s@k.o, public disclosure is typically in up to 7 days since fix
> is ready, but for linux-distros the deadline is 14 days max since
> linux-distros is notified even if the fix is not ready.  Apparently,
> this one makes Greg particularly unhappy about linux-distros.
> 
> 2. _If_ the reporter shares PoCs/exploits with linux-distros, then per
> current policy those should also be made public (within up to 7 days
> more after the vulnerability is publicly disclosed as such).  Linus said
> that this must be up to the reporter only, and we should not be imposing
> such policy.  In a sense, this is already up to the reporter - if they
> disagree, they just shouldn't post PoCs/exploits to linux-distros (can
> instead post an offer to share with individual distros) - however, this
> is problematic in practice because not everyone reads the rules before
> posting and sometimes people change their mind during the embargo time
> (or are required to "change their mind" by their employer, etc.)
> 
> I agree both of these are problems, and I suggest discussing them on
> oss-security.  Maybe we can arrive at satisfactory solutions/exceptions.
> 
> While we're at it, I'd like to point out that while the wording (in the
> commit above) that "the linux-distros rules do not contribute to
> actually fixing any potential security problems" is technically correct
> (yes, the _rules_ do not contribute to _upstream_ fixes), it may be
> misleading.  It implies that linux-distros members would not help fix
> bugs, whereas in that very StackRot/CVE-2023-3269 thread Vegard,
> receiving the messages as part of Oracle Linux's linux-distros
> membership, has actually contributed to fixing the bug upstream.  Vegard
> is probably too humble to bring this up, so I do.  Also, even when not
> contributing to upstream fixes, linux-distros members will generally
> "contribute to actually fixing any potential security problems" in their
> respective distros (even if e.g. by back-porting upstream fixes when
> those are ready).  So I would omit this wording if it were up to me.
> 
>> On 8/15/23 11:28, Jiri Kosina wrote:
>>> With my distro hat on, I really want the kernel security bugs to be
>>> *eventually* processed through linux-distros@ somehow, for one sole
>>> reason: it means that our distro security people will be aware of it,
>>> track it internally, and keep an eye on the fix being ported to all of our
>>> codestreams. This is exactly how this is done for all other packages.
>>>
>>> I would be curious to hear about this from other distros, but I sort of
>>> expect that they would agree.
>>
>> +1 from me; the distros list has been an extremely important resource
>> for distros in order to get fixes shipped out with minimal delay.
> 
> Yes, I'd like this to be happening as well, and the current kernel
> documentation does not preclude that from happening.  So now it's up to
> the people on s@k.o.
> 
>>> [1] https://git.kernel.org/linus/4fee0915e649b
> 
> Alexander
> 


-- 
Donald Buczek
buczek@molgen.mpg.de
Tel: +49 30 8413 1433

