Return-Path: <ksummit+bounces-2856-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ScK3C8pcpGlmewUAu9opvQ
	(envelope-from <ksummit+bounces-2856-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 16:35:38 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A237D1D0732
	for <lists@lfdr.de>; Sun, 01 Mar 2026 16:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E8D8300909A
	for <lists@lfdr.de>; Sun,  1 Mar 2026 15:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AFB2727FC;
	Sun,  1 Mar 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JT5is/vQ"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7328690
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772379334; cv=none; b=lohroNX0FRoCJsBM9axJMuT3c/A2wUZxrfRA58PUaX8Zlnt9icfR6rf0ZpbTwwjuwORb2Oms4QeExGkooOTI6QKpydZyxMyUMyQvBrMmts8jqGd6RuNCotOKkLy+vCulyVNck0vYYWsd5LbvPX2DKLyo9C5T0UPlhGC6l3xHNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772379334; c=relaxed/simple;
	bh=vEsDnXtsyqSZXucuD713ilaFIyg4UO06Ud8O03GflJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIDcB0rq/L+ezDOQbcBYtFZjnna+0dNdsIP7omHwP42nRvP9mxmFzfLzN1I+EJR8+jkKucvA1tfRFc+OcSR6uZTVxE2bNdh3g0arfddM4pzCzzp4EvkvF4Uku76B0ygzqdQtb9oSUu9z1QDYo1q/T2G6+4UBHwFcXtopRKQtnY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JT5is/vQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3F6E756D;
	Sun,  1 Mar 2026 16:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772379269;
	bh=vEsDnXtsyqSZXucuD713ilaFIyg4UO06Ud8O03GflJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JT5is/vQernakbm3kdfbN2eHL2YwxsFiekA0C20Lq10Zmjf3uoloQ/xttgusIlgDG
	 nKtOhGtAL81h8eDJQ2IzC2BESYzCAg6e++nn+8UOxWqpikgk2Y71hipLpdD1RVN6Oc
	 d+SxLpeogTHo8y2TSi02LRFhWo3l+kQYCxMDvreQ=
Date: Sun, 1 Mar 2026 16:35:26 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260301153526.GE2860169@killaraus.ideasonboard.com>
References: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
 <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaRZ1EIDE-SlqWOo@laps>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2856-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A237D1D0732
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
> On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
> >On Sat, 28 Feb 2026 21:28:57 +0100 (CET)
> > Richard Weinberger <richard@nod.at> wrote:
> >
> >> Wouldn't that only work if the report is able to upload the kernel debug
> >> info too?
> >
> > Yes, this would be nice if we had the help from the distros that could
> > automate this process.
> 
> So I've been poking at using LLMs for this.
> 
> decode_stacktrace.sh is great when you have a debug build handy, but
> asking a random bug reporter to obtain debuginfo, set up the tooling,
> and run the script is quite the hurdle.
> 
> The debuginfo problem is solvable on the server side though. Given a
> kernel version string from the oops, an LLM can figure out which distro
> and package version the reporter is running, pull the right debuginfo
> (or build from the matching config/tag if no debuginfo package exists),
> and run decode_stacktrace.sh itself.

Do we really have to use non-deterministic tools that will inevitably
produce correct-looking but otherwise useless backtraces from time to
time, confusing developers and wasting time for everybody, when we can
instead easily develop tools that will work in a deterministic fashion ?
I'm getting *really* sick of people pushing for LLM usage when it's
clearly the wrong tool. Please stop.

> In the example below it figured
> out this was an Arch chaotic-aur build, found no debuginfo package
> available, so it built vmlinux from the v7.0-rc1 tag with the Arch
> PKGBUILD config and verified the disassembly matched the crash dump
> byte-for-byte. That's the kind of thing no reporter is ever going to
> do, but a bot can do it routinely.
> 
> As an example, this bug report came in today with no replies:
> 
>    https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/
> 
> I fed it to an LLM. It decoded the stack trace (as described above),
> then traced the crash to iptfs_reassem_cont() at xfrm_iptfs.c:905:
> skb_put() on a non-linear skb. It identified the offending commit
> (5f2b6a9095743), the code author (Christian Hopps), the relevant
> maintainers, and a couple more vulnerable call sites in the same
> function. Not perfect, but enough to get the report to the right people
> with useful context already attached.
> 
> What I'd like to propose: set up something like bug@kernel.org with a
> bot that watches it. When a report comes in, it:
> 
>   1. Pulls the oops/stack trace from the email (if exists)
>   2. Figures out the kernel version, obtains or builds debuginfo, and
>      decodes the stack trace
>   3. Reads the relevant source, identifies root cause, offending commit,
>      and the right maintainers/lists
>   4. Forwards the report with its analysis to the right list, Cc'ing
>      the right people
> 
> One email address, no tooling required from the reporter, bugs get to
> the right list with a decoded stack trace and first-pass analysis. The
> analysis will be wrong sometimes, but even just the decoded trace and
> correct routing is better than what bugzilla gives us today.
> 
> For reference, below is the full output of the LLM analysis of the bug
> report linked above. This is what the bot would attach when forwarding
> a report to maintainers:
> 
> 
> ==============================================================================
> 1. Bug Summary
> ==============================================================================
> 
> A kernel panic occurs in the XFRM IP-TFS (IP Traffic Flow Security, RFC 9347)
> reassembly path when receiving inner packets that span three or more IPTFS
> tunnel packets. The crash is a BUG() in skb_put() (net/core/skbuff.c:2651),
> triggered by the SKB_LINEAR_ASSERT() macro, which fires because skb_put() is
> called on a socket buffer that has already been made non-linear by a prior
> fragment-sharing operation. The panic is trivially reproducible: establish an
> IPsec tunnel with IPTFS AGGFRAG mode using strongSwan, then send a ping with
> payload larger than the tunnel MTU ("ping -s 3333"). The receiving end panics
> in interrupt context.
> 
> Kernel versions : 7.0.0-rc1-1-mainline, 6.18.13-arch1-1, NixOS 6.18.13
> Distributions   : Arch Linux, NixOS
> Architecture    : x86_64 (SMP, PREEMPT full)
> Subsystem       : XFRM / IPsec / IP-TFS (net/xfrm/xfrm_iptfs.c)
> Module          : xfrm_iptfs
> Severity        : Critical -- kernel panic in IRQ context, immediate crash
> Reporter        : Hao Long <me@imlonghao.com>
> Date            : 2026-03-01
> 
> ==============================================================================
> 2. Code Analysis
> ==============================================================================
> 
> --- Files and functions involved ---
> 
>    net/xfrm/xfrm_iptfs.c:905    iptfs_reassem_cont()   -- FAULTING CALLER
>    net/xfrm/xfrm_iptfs.c:1266   iptfs_input_ordered()
>    net/xfrm/xfrm_iptfs.c:1725   iptfs_input()
>    net/core/skbuff.c:2651        skb_put()              -- BUG site
>    include/linux/skbuff.h:2699   SKB_LINEAR_ASSERT()    -- the assertion macro
> 
> The crash site is net/xfrm/xfrm_iptfs.c line 905 in iptfs_reassem_cont():
> 
>      /* Try share then copy. */
>      if (fragwalk &&
>          iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
>              iptfs_skb_add_frags(newskb, fragwalk, data, copylen);  /* line 902 */
>      } else {
>              /* copy fragment data into newskb */
>              if (skb_copy_seq_read(st, data, skb_put(newskb, copylen),  /* line 905 -- BUG */
>                                    copylen)) {
> 
> skb_put() (net/core/skbuff.c:2648-2657) contains:
> 
>      void *skb_put(struct sk_buff *skb, unsigned int len)
>      {
>              void *tmp = skb_tail_pointer(skb);
>              SKB_LINEAR_ASSERT(skb);             /* line 2651 -- BUG_ON(skb_is_nonlinear(skb)) */
>              skb->tail += len;
>              ...
>      }
> 
> SKB_LINEAR_ASSERT expands to BUG_ON(skb->data_len != 0). A non-linear skb
> (one with data in page fragments or a frag_list, indicated by data_len > 0)
> cannot be extended with skb_put() -- only the linear head area is addressable
> via skb_put().
> 
> There are two additional skb_put() calls on newskb in the same function that
> are vulnerable to the same issue:
> 
>    net/xfrm/xfrm_iptfs.c:845    memcpy(skb_put(newskb, runtlen), ...)
>    net/xfrm/xfrm_iptfs.c:870    skb_copy_seq_read(st, data, skb_put(newskb, copylen), ...)
> 
> Line 845 is unlikely to trigger because it operates on a freshly allocated
> newskb. Line 870 (IP header completion path) could trigger under the same
> conditions as line 905 if the IP header is not yet complete when a non-linear
> newskb is being continued.
> 
> --- Recent commits touching the relevant code ---
> 
>    5f2b6a9095743  xfrm: iptfs: add skb-fragment sharing code          <-- INTRODUCED THE BUG
>    3f3339885fb34  xfrm: iptfs: add reusing received skb for the tunnel egress packet
>    0756947654468  xfrm: iptfs: handle received fragmented inner packets
>    6c82d24336718  xfrm: iptfs: add basic receive packet (tunnel egress) handling
>    8579d342ea2b3  xfrm: iptfs: add fragmenting of larger than MTU user packets
>    b96ba312e21c9  xfrm: iptfs: share page fragments of inner packets
>    0e4fbf013fa56  xfrm: iptfs: add user packet (tunnel ingress) handling
>    4b3faf610cc63  xfrm: iptfs: add new iptfs xfrm mode impl
>    ed58b186c7737  xfrm: iptfs: add tracepoint functionality
>    6be02e3e4f376  xfrm: iptfs: handle reordering of received packets
> 
> Author of the faulting code (git blame on lines 895-910):
> 
>    5f2b6a9095743a (Christian Hopps  2024-11-14 02:07:10 -0500)  -- all lines
> 
> The entire fragment-sharing block (lines 891-911) was added in commit
> 5f2b6a9095743 by Christian Hopps as part of the 17-patch IPTFS series merged
> via Steffen Klassert's ipsec-next tree for 6.14-rc1.
> 
> --- Root cause hypothesis ---
> 
> The bug is a logic error in multi-packet reassembly with fragment sharing:
> 
> 1. A large inner IP packet (e.g., 3333-byte ICMP echo) arrives at the IPTFS
>     tunnel endpoint fragmented across multiple IPTFS tunnel packets.
> 
> 2. For the first continuation packet, iptfs_reassem_cont() is called. The
>     conditions at lines 892-894 are satisfied:
> 
>         if (!skb_has_frag_list(skb) && !skb_has_frag_list(newskb) &&
>             (skb->head_frag || skb->len == skb->data_len) &&
>             skb->pp_recycle == newskb->pp_recycle)
> 
>     and iptfs_skb_can_add_frags() returns true, so iptfs_skb_add_frags()
>     (line 902) shares page fragments from the incoming skb into newskb. This
>     makes newskb NON-LINEAR: newskb->data_len > 0, newskb->nr_frags > 0.
> 
> 3. newskb is saved in xtfs->ra_newskb and the function returns, awaiting the
>     next continuation packet.
> 
> 4. When the second (or subsequent) continuation packet arrives,
>     iptfs_reassem_cont() is called again with the same (now non-linear) newskb.
>     This time, one of the fragment-sharing preconditions fails -- for example:
> 
>     - The new incoming skb may not have head_frag set AND skb->len != skb->data_len
>     - iptfs_skb_can_add_frags() returns false (e.g., MAX_SKB_FRAGS reached)
>     - The pp_recycle flags don't match
> 
> 5. Execution falls to the else branch (line 903), which calls:
> 
>         skb_put(newskb, copylen)
> 
>     But newskb is non-linear from step 2. SKB_LINEAR_ASSERT fires. Kernel panic.
> 
> Register state from the crash confirms this analysis:
>    RSI = 0x30 (copylen = 48 bytes being appended)
>    RAX = 0x56e (current skb->len = 1390, including fragment data)
> 
> --- Affects mainline, stable, or distro-specific? ---
> 
> This affects MAINLINE and all kernels containing commit 5f2b6a9095743, which
> was merged for the 6.14-rc1 merge window. It is not distro-specific -- it was
> reproduced on Arch Linux and NixOS with three different kernel versions
> (6.18.13 and 7.0.0-rc1).
> 
> ==============================================================================
> 3. Prior Reports
> ==============================================================================
> 
> --- Identical report (this bug) ---
> 
>    Subject: [BUG] Kernel Panic in iptfs_reassem_cont when handling large packets
>    Author:  Hao Long <me@imlonghao.com>
>    Date:    2026-03-01
>    URL:     https://lore.kernel.org/netdev/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/
>    Status:  NO REPLIES as of analysis time
> 
> --- Related patch (different bug, same file, same day) ---
> 
>    Subject: [PATCH] xfrm: iptfs: validate inner IPv4 header length in IPTFS payload
>    Author:  Roshan Kumar <roshaen09@gmail.com>
>    Date:    2026-03-01
>    URL:     https://lore.kernel.org/all/20260301105638.11479-1-roshaen09@gmail.com/
>    Fixes:   6c82d2433671 ("xfrm: iptfs: add basic receive packet (tunnel egress) handling")
>    Note:    Fixes a different bug -- infinite loop with tot_len=0 inner IPv4
>             header. Does NOT fix the skb_put crash.
> 
> --- Original patch series that introduced the code ---
> 
>    Subject: [PATCH ipsec-next 00/17] Add IP-TFS mode to xfrm
>    Author:  Steffen Klassert <steffen.klassert@secunet.com>
>    Date:    2025-01-09
>    URL:     https://lore.kernel.org/netdev/20250109094321.2268124-1-steffen.klassert@secunet.com/
> 
> No existing fix patch for this specific crash was found. This is a NEW,
> UNRESOLVED bug. It is not a known regression from a specific commit (it has
> existed since the fragment-sharing code was first merged).
> 
> ==============================================================================
> 4. Decoded Stack Trace
> ==============================================================================
> 
> Debug symbols: Built vmlinux and xfrm_iptfs.ko from v7.0-rc1 tag using the
> Arch Linux PKGBUILD config (CONFIG_DEBUG_INFO=y, CONFIG_DEBUG_INFO_DWARF5=y).
> Verified by disassembly that the compiled code is BYTE-IDENTICAL to the
> chaotic-aur prebuilt linux-mainline-7.0rc1-1 package: the entire
> iptfs_reassem_cont function (365 instructions) and skb_put function produce
> zero diff between local, chaotic-aur, and crash-dump code bytes. The 1-byte
> difference in the return-thunk jmp target (0xe9 0xc4 vs 0xe9 0xd4) is KASLR
> runtime patching. Relocation records confirm +0x128 is call skb_put, +0x144
> is call skb_copy_seq_read.
> 
> Note: Actual debug packages are not available for this kernel. The AUR
> PKGBUILD has "!debug" and explicitly strips vmlinux. No debuginfod server
> (Arch, elfutils, Fedora, Ubuntu) indexes build ID
> b84afef9bed61122840347d0d1295877239d5881.
> 
> Full decoded output from scripts/decode_stacktrace.sh:
> 
> [  412.126912] ------------[ cut here ]------------
> [  412.126945] kernel BUG at net/core/skbuff.c:2651!
> [  412.126974] Oops: invalid opcode: 0000 [#1] SMP PTI
> [  412.127009] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted 7.0.0-rc1-1-mainline #1 PREEMPT(full)
> [  412.127061] Hardware name: Vultr VC2, BIOS
> [  412.127076] RIP: 0010:skb_put (net/core/skbuff.c:2651 (discriminator 3))       <<<< BUG: SKB_LINEAR_ASSERT
> All code
> ========
>     0:   bc 00 00 00 01          mov    $0x1000000,%esp
>     5:   77 70                   ja     0x77
>     7:   48 89 c2                mov    %rax,%rdx
>     a:   48 03 87 c8 00 00 00    add    0xc8(%rdi),%rax
>    11:   01 f2                   add    %esi,%edx
>    13:   89 97 bc 00 00 00       mov    %edx,0xbc(%rdi)
>    19:   39 97 c0 00 00 00       cmp    %edx,0xc0(%rdi)
>    1f:   0f 82 c0 c2 14 ff       jb     0xffffffffff14c2e5
>    25:   e9 c4 a0 2f 00          jmp    0x2fa0ee
>    2a:*  0f 0b                   ud2             <-- trapping instruction (BUG())
> Code starting with the faulting instruction
> ===========================================
>     0:   0f 0b                   ud2
> [  412.127288] Call Trace:
> [  412.127298]  <IRQ>
> [  412.127308] iptfs_reassem_cont (net/xfrm/xfrm_iptfs.c:905 (discriminator 1)) xfrm_iptfs   <<<< FAULTING CALLER
> [  412.127335] iptfs_input_ordered (net/xfrm/xfrm_iptfs.c:1266) xfrm_iptfs
> [  412.127356] iptfs_input (net/xfrm/xfrm_iptfs.c:1725 (discriminator 4)) xfrm_iptfs
> [  412.127373]  ? esp_input+0x1f7/0x330 [esp4]
> [  412.127399]  xfrm_input (net/xfrm/xfrm_input.c:695)
> [  412.127449]  xfrm4_esp_rcv (net/ipv4/xfrm4_protocol.c:104 (discriminator 1))
> [  412.127473]  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 7))
> [  412.127497]  ip_local_deliver_finish (include/linux/rcupdate.h:883 net/ipv4/ip_input.c:242)
> [  412.127509]  __netif_receive_skb_core.constprop.0 (net/core/dev.c:2507 net/core/dev.c:6109)
> [  412.127529]  ? kmalloc_reserve (net/core/skbuff.c:616 (discriminator 107))
> [  412.127540]  ? __alloc_skb (net/core/skbuff.c:714 (discriminator 1))
> [  412.127551]  ? napi_alloc_skb (net/core/skbuff.c:853)
> [  412.127568]  ? page_to_skb+0x2a9/0x400 [virtio_net]
> [  412.127610]  __netif_receive_skb_list_core (net/core/dev.c:6232)
> [  412.127628]  netif_receive_skb_list_internal (net/core/dev.c:6300 net/core/dev.c:6389)
> [  412.127645]  napi_complete_done (include/linux/list.h:45 include/net/gro.h:524 net/core/dev.c:6757)
> [  412.127660]  ? virtnet_rq_get_buf+0x2d/0x60 [virtio_net]
> [  412.127684]  virtnet_poll+0x6de/0xdbd [virtio_net]
> [  412.127710]  __napi_poll (arch/x86/include/asm/jump_label.h:37 include/trace/events/napi.h:14 net/core/dev.c:7685)
> [  412.127723]  ? skb_defer_free_flush (net/core/dev.c:6802 (discriminator 3))
> [  412.127745]  net_rx_action (net/core/dev.c:7747 net/core/dev.c:7899)
> [  412.127761]  handle_softirqs (arch/x86/include/asm/jump_label.h:37 include/trace/events/irq.h:142 kernel/softirq.c:623)
> [  412.127802]  __irq_exit_rcu (kernel/softirq.c:657 kernel/softirq.c:496 kernel/softirq.c:723)
> [  412.127817]  common_interrupt (arch/x86/kernel/irq.c:326 (discriminator 49))
> [  412.127848]  </IRQ>
> [  412.127858]  <TASK>
> [  412.127867]  asm_common_interrupt (arch/x86/include/asm/idtentry.h:688)
> [  412.127904] RIP: 0010:pv_native_safe_halt (arch/x86/kernel/paravirt.c:63)
> [  412.127926]  default_idle
> [  412.127926]  default_idle_call
> [  412.127926]  do_idle
> [  412.127926]  cpu_startup_entry
> [  412.127926]  start_secondary
> [  412.127926]  common_startup_64
> [  412.127926]  </TASK>
> 
> --- Most relevant frames ---
> 
>    #0  skb_put()                  net/core/skbuff.c:2651
>        BUG_ON(skb_is_nonlinear(skb)) fires -- skb->data_len != 0 because page
>        fragments were previously added by iptfs_skb_add_frags().
> 
>    #1  iptfs_reassem_cont()       net/xfrm/xfrm_iptfs.c:905      <<<< ROOT CAUSE
>        The call: skb_put(newskb, copylen)
>        This is the else-branch fallback copy path after the fragment-sharing
>        check at lines 900-901 fails. newskb was made non-linear by a prior
>        invocation that took the fragment-sharing path at line 902.
> 
>    #2  iptfs_input_ordered()      net/xfrm/xfrm_iptfs.c:1266
>        Calls iptfs_reassem_cont() to continue reassembly of a fragmented
>        inner packet using the next IPTFS tunnel packet in sequence.
> 
>    #3  iptfs_input()              net/xfrm/xfrm_iptfs.c:1725
>        Entry point for IPTFS tunnel packet processing (xfrm input callback).
> 
> --- Inline expansions / compiler artifacts ---
> 
>    - "discriminator 1" at xfrm_iptfs.c:905 indicates this is a specific
>      branch path within the source line (the else branch).
>    - "discriminator 3" at skbuff.c:2651 indicates the BUG_ON expansion
>      within skb_put().
>    - ip_local_deliver_finish shows inlining from include/linux/rcupdate.h:883
>      (rcu_read_lock/unlock wrappers).
>    - napi_complete_done shows inlining from include/net/gro.h:524
>      (GRO list flush helpers).
> 
> ==============================================================================
> 5. Contacts
> ==============================================================================
> 
> --- Maintainers (from scripts/get_maintainer.pl -f net/xfrm/xfrm_iptfs.c) ---
> 
>    Steffen Klassert <steffen.klassert@secunet.com>   (maintainer: NETWORKING [IPSEC])
>    Herbert Xu <herbert@gondor.apana.org.au>           (maintainer: NETWORKING [IPSEC])
>    "David S. Miller" <davem@davemloft.net>            (maintainer: NETWORKING [IPSEC])
>    Eric Dumazet <edumazet@google.com>                 (maintainer: NETWORKING [GENERAL])
>    Jakub Kicinski <kuba@kernel.org>                   (maintainer: NETWORKING [GENERAL])
>    Paolo Abeni <pabeni@redhat.com>                    (maintainer: NETWORKING [GENERAL])
> 
> --- Reviewer ---
> 
>    Simon Horman <horms@kernel.org>                    (reviewer: NETWORKING [GENERAL])
> 
> --- Code author (wrote the faulting code) ---
> 
>    Christian Hopps <chopps@labn.net>
>      Author of commit 5f2b6a9095743 ("xfrm: iptfs: add skb-fragment sharing code")
>      Author of the entire xfrm_iptfs.c file (all commits 4b3faf610cc63 through
>      ed58b186c7737, November 2024).
> 
> --- Git signers / recent contributors ---
> 
>    Kees Cook <kees@kernel.org>                        (commit_signer: 50%, recent treewide changes)
>    Neil Armstrong <neil.armstrong@linaro.org>          (commit_signer: 50%)
> 
> --- Mailing lists ---
> 
>    netdev@vger.kernel.org       (primary -- NETWORKING [IPSEC])
>    linux-kernel@vger.kernel.org
> 
> ==============================================================================
> 6. Recommended Next Steps
> ==============================================================================
> 
> --- Does a fix already exist? ---
> 
> No. No fix patch exists on lore.kernel.org or in mainline as of 2026-03-01.
> This is a new, unresolved bug.
> 
> --- Is more information needed from the reporter? ---
> 
> No. The bug report is complete: it includes kernel version, reproduction steps,
> full stack trace, and confirmation across three kernel/distro combinations. The
> root cause is clear from code analysis.
> 
> --- Suggested patch direction ---
> 
> The fix must ensure that skb_put() is never called on a non-linear newskb in
> iptfs_reassem_cont(). The most straightforward approach:
> 
>    Option A (simplest): In the else branch at line 903, before calling
>    skb_put(), linearize newskb if it is non-linear:
> 
>        } else {
>                if (skb_is_nonlinear(newskb) &&
>                    __skb_linearize(newskb))
>                        goto abandon;
>                if (skb_copy_seq_read(st, data, skb_put(newskb, copylen), ...))
> 
>    This preserves correctness at the cost of a copy when the fallback path is
>    taken after prior fragment sharing. The same fix should be applied to the
>    skb_put() at line 870 (IP header completion path).
> 
>    Option B (more targeted): Always add remaining data as fragments instead of
>    falling back to skb_put(). When the fragwalk path fails, allocate new page
>    fragments and add them to the skb rather than trying to copy into the linear
>    head. This avoids the linearization cost but is more complex.
> 
>    Option C (conservative): Disable fragment sharing when reassembly will span
>    more than two tunnel packets, ensuring newskb stays linear throughout
>    reassembly. Simplest to reason about but gives up the optimization for
>    large packets.
> 
> The Fixes tag should be:
> 
>      Fixes: 5f2b6a9095743 ("xfrm: iptfs: add skb-fragment sharing code")
>      Reported-by: Hao Long <me@imlonghao.com>
> 
> --- Which tree should the fix target? ---
> 
>    - Mainline (net tree, via Steffen Klassert / ipsec)
>    - Then backport to stable (affects all kernels >= 6.14 that contain
>      commit 5f2b6a9095743)

-- 
Regards,

Laurent Pinchart

